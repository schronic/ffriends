class FightsController < ApplicationController
  before_action :set_fight, only: [:show]
  before_action :set_arena

  def show
   @all_opponents = Friend.where.not(user_id: current_user.id)
   @opponents = @all_opponents.where(purchase_id: nil)
   @friend = Friend.find(@fight.friend_id)
   @opponent = @opponents.sample

   @own_rating = @friend.rating
   @opp_rating = @opponent.rating

   @total = @own_rating + @opp_rating
   @procentage = rand(@total)
  end

  def new
    @fight = Fight.new
    @friends = Friend.where(user_id: current_user.id).map { |f| ["ID: #{f.id} - With a rating of: #{f.rating}", f.id]}
  end

  def create
    @fight = Fight.new(strong_params)
    @fight.save
    redirect_to arena_fight_path(@arena, @fight)
  end

  private

  def set_fight
    @fight = Fight.find(params[:id])
    authorize @fight
  end

  def set_arena
    @arena = Arena.find(params[:arena_id])
    authorize @arena
  end

  def strong_params
    params.require(:fight).permit(:arena_id, :friend_id, :name, :date)
  end
end
