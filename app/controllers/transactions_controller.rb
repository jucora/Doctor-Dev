class TransactionsController < ApplicationController
  before_action :logged_in?
  before_action :balance, only: :create
  
  def index
    @current_user_transactions = current_user.transactions.with_group
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Transaction.create(transaction_params)
    @transaction.author_id = current_user.id

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

  def external_transactions
    @external_transactions = Transaction.where(group_id: nil)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:amount, :group_id)
  end

  def balance
    unless current_user.amount >= transaction_params[:amount].to_f
      flash[:alert] = "You don't have enough balance!"
      redirect_to new_transaction_path
    end
  end
end
