class UsersController < ApplicationController
  def new
    @user= User.new
  end

  def create
    @user = User.new
    @user.save
  end

  def show
    find_user
    @my_trajects = current_user.trajects
  end

  def edit
    find_user
  end

  def update
    find_user
    @user.update(user_params)
    redirect_to user_path(current_user, tab: "profile")
  end

  def profile
    find_user
  end

  private
  def find_user
    @user = User.find(current_user.id)
    authorize @user
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :photo)
  end
end
