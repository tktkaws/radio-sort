class AddIndexOnLike < ActiveRecord::Migration[5.2]
  def change
    add_index :likes, :user_id
    add_index :likes, :radio_id
    add_index :likes, [:user_id, :radio_id], unique: true
  end
end
