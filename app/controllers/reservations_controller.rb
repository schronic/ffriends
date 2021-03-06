class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]
  # before_action :set_friend, only: [:create]
  skip_before_action :authenticate_user!, only: %i[index show new create edit update destroy]

  def index
    @reservations = policy_scope(Reservation).order(user_id: :desc)
    @purchase = Purchase.new
  end

  def show
  end

  def new
    @reservation = Reservations.new
    @reservation.user_id = current_user
    authorize @reservation
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    authorize @reservation
    if @reservation.save
      redirect_to friends_path
    else
      render html: "<h1>You received the following error:</h1>
      <h3><em>#{@reservation.errors.full_messages}</em></h3>".html_safe
    end
  end

  def edit
  end

  def update
    @reservation.update(reservation_params)
    if @reservation.save
      redirect_to @reservation
    else render :edit
    end
  end

  def destroy
    @reservation.destroy
    @reservations = Reservation.all
    if params.dig(:reservation, :in_cart) && @reservations.any? # == 'true' (not a boolean in params)
      redirect_to cart_path
    else
      redirect_to friends_path
    end
    # split with if/else based on where you were when removed from cart
    # redirect_to cart_path
  end

private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  # def set_friend
  #   @friend = Friend.find(params[:reservation[:friend_id]])
  # end

  def reservation_params
    params.require(:reservation).permit(:friend_id, :user_id)
  end
end
