class CreateArenas < ActiveRecord::Migration[5.2]
  def change
    create_table :arenas do |t|
      t.string :name
      t.string :address

      t.timestamps
    end
  end
end
