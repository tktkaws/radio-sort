class ChangeSomeColumnOnComment < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :radio_id, false, 0
    change_column_null :comments, :content, false, "content"
    change_column_null :comments, :user_id, false, 0
  end
end