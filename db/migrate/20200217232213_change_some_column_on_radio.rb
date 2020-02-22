class ChangeSomeColumnOnRadio < ActiveRecord::Migration[5.2]
  def change
    change_column_null :radios, :title, false, "title"
    change_column_null :radios, :personality, false, "personality"
    change_column_null :radios, :station, false, "station"
    change_column_null :radios, :start_time, false, '2020-02-03 05:00:00'
    change_column_null :radios, :length, false, 0
  end
end