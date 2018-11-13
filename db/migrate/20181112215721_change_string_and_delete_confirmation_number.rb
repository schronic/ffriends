class ChangeStringAndDeleteConfirmationNumber < ActiveRecord::Migration[5.2]
  def change
    rename_column :friends, :strenght , :strength
    remove_column :purchases, :confirmation_number
  end

end
