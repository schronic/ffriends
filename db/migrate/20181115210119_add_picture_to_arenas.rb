class AddPictureToArenas < ActiveRecord::Migration[5.2]
  def change
    add_column :arenas, :picture, :string
  end
end
