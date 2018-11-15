class AddCoordinatesToFights < ActiveRecord::Migration[5.2]
  def change
    add_column :fights, :latitude, :float
    add_column :fights, :longitude, :float
  end
end
