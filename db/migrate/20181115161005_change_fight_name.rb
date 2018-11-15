class ChangeFightName < ActiveRecord::Migration[5.2]
  def change
    rename_column :fights, :fight_id, :friend_id
  end
end
