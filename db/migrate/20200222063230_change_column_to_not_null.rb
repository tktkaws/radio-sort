class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :radios, :personality,:string, null: true
  end
end
