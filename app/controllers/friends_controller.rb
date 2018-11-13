class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @friends = policy_scope(Friend).order(created_at: :desc)
  end

  def show
  end

  def new
    @friend = current_user.friends.new
    authorize @friend
  end

  def create
    @friend = current_user.friends.new(friend_params)
    authorize @friend
    if @friend.save
      redirect_to @friend
    else render :new
    end
    redirect_to @friend
  end

  def edit
  end

  def update
    @friend.update(friend_params)
    if @friend.save
      redirect_to @friend
    else render :edit
    end
  end

  def destroy
    @friend.destroy
    redirect_to friends_path
  end
private

  def set_friend
    @friend = Friend.find(params[:id])
    authorize @friend
  end

  def friend_params
    params.require(:friend).permit(:rating, :strength,
      :agility, :weight, :height, :nationality,
      :user_id, :slogan, :age, :picture, :price,
      :wins, :losses, :description, :purchase_id)
  end
end
