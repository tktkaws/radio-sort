class AddPointOnLike < ActiveRecord::Migration[5.2]
  def change
    add_column :likes, :point, :integer,null: false, default: 0
    remove_column :likes, :position, :integer
  end
end
