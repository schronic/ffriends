class CreateFights < ActiveRecord::Migration[5.2]
  def change
    create_table :fights do |t|
      t.references :arena, foreign_key: true
      t.references :fight, foreign_key: true
      t.string :name
      t.date :date

      t.timestamps
    end
  end
end
