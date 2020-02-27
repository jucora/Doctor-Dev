class TransactionsController < ApplicationController
  def new
  	@transaction = Transaction.new
  end

  def create
  	@transaction = Transaction.create(transaction_params)
  	@transaction.author_id = current_user.id
  	
  	if current_user.amount >= @transaction.amount
  		if @transaction.save 
  			current_user.update_attributes(amount: current_user.amount - @transaction.amount)
  			flash[:notice] = 'The transaction was created!'
  			redirect_to @transaction
  		else
  			flash[:alert] = 'Something went wrong!'
  			render :new
  		end
  	else
  		flash[:alert] = "You don't have balance!"
  		render :new
  	end
  end

  def show
  	@transaction = Transaction.find(params[:id])
  end

  def transactions
    @transactions = Transaction.where.not(group_id: nil).where(author_id: current_user.id).order(created_at: 'desc')
  end

  def external_transactions
    @external_transactions = Transaction.where(group_id: nil)
  end

  private

  def transaction_params
  	params.require(:transaction).permit(:amount, :group_id)
  end
end
