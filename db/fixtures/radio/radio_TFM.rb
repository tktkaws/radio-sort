require 'csv'

CSV.foreach('/Users/takayukitakahashi/RubymineProjects/radio-sort/db/xml/TFMweekly加工済.csv', headers: true) do |row|
  Radio.create(
    title: row['title'],
    personality: row['pfm'],
    station: row['station'],
    start_time: row['ft'],
    end_time: row['title'],
    length: row['dur'],
    image: "TFM/#{row['filename']}"
  )
end
