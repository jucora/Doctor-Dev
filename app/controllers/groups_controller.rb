class GroupsController < ApplicationController
  before_action :logged_in?
  def index
    @groups = Group.alphabetical_order
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    @group.user_id = current_user.id
    if @group.save
      redirect_to @group
      flash[:notice] = 'Group created!'
    else
      render :new
      flash[:alert] = 'Something went wrong'
    end
  end

  def show
    @group = Group.find(params[:id])
  end

  def group_transactions
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end
end
