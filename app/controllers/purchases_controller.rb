class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @purchases = policy_scope(Purchase).order(created_at: :desc)
  end

  def show
  end

  def new
    @purchase = Purchase.create(purchase_params)
    authorize @purchase
    @reservations.each do |reservation|
      friend = reservation.friend
      friend.update(user_id:reservation.user_id)
      friend.update(purchase_id: @purchase.id)
    end
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

private

  def set_purchase
    @purchase = Purchase.find(params[:id])
    authorize @purchase
  end

  def purchase_params
    params.require(:purchase).permit(:total_price, :user_id)
  end
end
