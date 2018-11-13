class UsersController < ApplicationController
  defore_action :set_user, only: [:show, :destroy]

  def show
  end

  def new
    @user = User.new
  end

  def create
    raise
    @user = User.new(user_params)
    @user.save
    redirect_to friends_path
  end

  def destroy
    @user.destroy
    redirect_to friends_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :address, :first_name, :last_name, :picture)
  end
end
