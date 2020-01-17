class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :radio_id
      t.integer :position
      t.integer :row_order
      t.integer :point
      t.timestamps
    end
  end
end
