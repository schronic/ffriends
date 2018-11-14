class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]


def index
  if params[:term]
    @friends = policy_scope(Friend).order(created_at: :asc)
    @friends = Friend.where(params[:term].to_sym => params[:attr])
  else
    @friends = policy_scope(Friend).order(created_at: :asc)
  end
end

  def show
    @reservation = Reservation.new
  end

  def new
    @friend = Friend.new
    authorize @friend
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    authorize @friend
    if @friend.save
      redirect_to @friend
    else render :new
    end
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
      :wins, :losses, :description, :purchase_id, :term, :attr)
  end
end
