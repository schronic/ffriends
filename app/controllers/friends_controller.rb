class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @friends = Friend.all
  end

  def show
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.save
    redirect_to @friend
  end

  def edit
  end

  def update
    @friend.update(friend_params)
    redirect_to @friend
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end

private

  def set_friend
    @friend = Friend.find(params[:id])
  end

  def friend_params
    params.require(:friend).permit(:rating, :strength,
      :agility, :weight, :height, :nationality,
      :user_id, :slogan, :age, :picture, :price,
      :wins, :losses, :description, :purchase_id)
  end
end
