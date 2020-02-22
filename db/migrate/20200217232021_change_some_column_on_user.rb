class ChangeSomeColumnOnUser < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :gender, false, 0
    change_column_null :users, :age, false, 0
  end
end
