class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :rating
      t.string :strength
      t.string :agility
      t.string :weight
      t.string :height
      t.string :nationality
      t.references :user, foreign_key: true
      t.string :slogan
      t.integer :age
      t.string :picture
      t.integer :price
      t.integer :wins
      t.integer :losses
      t.string :description
      t.references :purchase, foreign_key: true

      t.timestamps
    end
  end
end
