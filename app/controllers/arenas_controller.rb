class ArenasController < ApplicationController
  before_action :set_arena, only: [:show]
  def index
    @arenas = policy_scope(Arena).where.not(latitude: nil, longitude: nil)

    @markers = @arenas.map do |arena|
      {
        lng: arena.longitude,
        lat: arena.latitude,
        infoWindow: { content: render_to_string(partial: "/arenas/map_window", locals: { arena: arena }) }

      }
    end
  end

  def show
  end

  private

  def set_arena
    @arena = Arena.find(params[:id])
    authorize @arena
  end
end
