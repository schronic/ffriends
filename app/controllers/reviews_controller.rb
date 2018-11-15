class ReviewsController < ApplicationController
before_action :set_friend, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @reviews = policy_scope(Review).order(created_at: :asc)
  end

  def new
    @friend = Friend.find(params[:friend_id])
    authorize @friend
    @review = Review.new
    authorize @review
  end

  def create
    @friend = Friend.find(params[:friend_id])
    authorize @friend
    @review = Review.new(review_params)
    authorize @review
    @review.save
    redirect_to friend_path(@friend)
  end

  private

  def set_friend
    @review = Review.find(params[:id])
    authorize @friend
  end

  def review_params
    params.require(:review).permit(:user_id, :friend_id, :content)
  end
end
