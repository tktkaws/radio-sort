class ChangeSomeColumnOnLike < ActiveRecord::Migration[5.2]
  def change
    change_column_null :likes, :radio_id, false, 0
    change_column_null :likes, :user_id, false, 0
    change_column_null :likes, :row_order, false, 0
    change_column_null :likes, :point, false, 0
    remove_column :likes, :point, :integer
  end
end