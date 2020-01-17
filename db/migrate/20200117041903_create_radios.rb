class CreateRadios < ActiveRecord::Migration[5.2]
  def change
    create_table :radios do |t|
      t.string :title
      t.string :personality
      t.string :image
      t.string :station
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length

      t.timestamps
    end
  end
end
