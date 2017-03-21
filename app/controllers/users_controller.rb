class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
  end

  def show
    find_user
    @my_trajects = current_user.trajects

  end

  def edit
  end

  def update
  end

  private
  def find_user
    @user = User.find(current_user.id)
    authorize @user
  end
end
