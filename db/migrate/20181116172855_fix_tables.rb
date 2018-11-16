class FixTables < ActiveRecord::Migration[5.2]
  def change
        remove_column :arenas, :capacity
        remove_column :arenas, :level
        remove_column :arenas, :address
        remove_column :fights, :date
        drop_table :carts
  end
end
