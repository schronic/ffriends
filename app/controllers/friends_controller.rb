class FriendsController < ApplicationController
  before_action :set_friend, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @reservation = Reservation.new
    @reservations = Reservation.all
    if params[:term]
      @friends = policy_scope(Friend).order(created_at: :asc)
      @friends = Friend.where(params[:term].to_sym => params[:attr])
    else
      @friends = policy_scope(Friend).order(created_at: :asc)
    end
  end

  def show
    @reservation = Reservation.new
    if user_signed_in?
      @reserved = Reservation.where(user_id: current_user.id, friend_id: params[:id])
    end
    @user = User.find(@friend.user_id)
    # If we change @user to @owner we could show everyone each friend's owner
  end

  def new
    @friend = Friend.new
    authorize @friend
  end

  def create
    @friend = Friend.new(friend_params)
    @friend.user = current_user
    @friend.wins = 0
    @friend.losses = 0
    @friend.rating = (rating_generator / 1.6)
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

  def rating_generator
    s = Friend::STRENGTH.index(@friend.strength)
    h = Friend::HEIGHT.index(@friend.height)
    a = Friend::AGILITY.index(@friend.agility)
    w = Friend::WEIGHT.index(@friend.weight)
    return (s + h + a + w)
    end
end
