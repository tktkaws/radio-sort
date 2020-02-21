class ChangeSomeColumnOnRelation < ActiveRecord::Migration[5.2]
  def change
    change_column_null :relations, :follower_id, false, 0
    change_column_null :relations, :followed_id, false, 0
  end
end