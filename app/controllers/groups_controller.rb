class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def new
  	@group = Group.new
  end

  def show
  	@group = Group.find(params[:id])
  end
end
