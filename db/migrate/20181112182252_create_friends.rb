class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :rating
      t.integer :strenght
      t.integer :agility
      t.integer :weight
      t.integer :height
      t.string :nationality
      t.string :slogan
      t.integer :age
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :wins
      t.integer :losses
      t.text :description
      t.references :purchase, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
