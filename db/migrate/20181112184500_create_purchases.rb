class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.integer :total_price
      t.integer :confirmation_number
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
