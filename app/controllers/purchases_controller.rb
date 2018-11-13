class PurchasesController < ApplicationController
  before_action :set_purchase, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @purchases = policy_scope(Purchase).order(created_at: :desc)
  end

  def show
  end

  def new
    @purchase = current_user.purchases.new
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    authorize @purchase
    if @purchase.save
      redirect_to @purchase
    else render :new
    end
    redirect_to @purchase
  end

  def destroy
    @purchase.destroy
    redirect_to purchases_path
  end

  def cart

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
