class FightsController < ApplicationController
  before_action :set_fight, only: [:show]
  before_action :set_arena

  def show
  end

  def new
    @fight = Fight.new
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
