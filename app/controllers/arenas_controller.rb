class ArenasController < ApplicationController
  def index
    @arenas = policy_scope(Arena).where.not(latitude: nil, longitude: nil)

    @markers = @arenas.map do |arena|
      {
        lng: arena.longitude,
        lat: arena.latitude,
        infoWindow: { content: render_to_string(partial: "/arenas/map_window", locals: { arenas: arena }) }

      }
    end
  end
end
