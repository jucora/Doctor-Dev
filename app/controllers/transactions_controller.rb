class TransactionsController < ApplicationController
  before_action :logged_in?
  before_action :balance, only: :create
  before_action :transaction_type, only: %i[index new]

  def index
    if @type == 'group_transaction'
      @transactions = current_user.transactions.with_group
    elsif @type == 'external_transaction'
      @transactions = current_user.transactions.without_group
    end
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)

    if @transaction.save
      current_user.update_attributes(amount: current_user.amount - @transaction.amount)
      flash[:notice] = 'The transaction was created!'
      redirect_to @transaction
    else
      render :new
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :group_id, :name)
  end

  def balance
    unless current_user.amount >= transaction_params[:amount].to_f
      flash[:alert] = "You don't have enough balance!"
      redirect_to new_transaction_path
    end
  end

  def transaction_type
    unless cookies[:transaction_type].present?
      cookies[:transaction_type] = params[:type]
    end
    @type = cookies[:transaction_type]
  end
end
