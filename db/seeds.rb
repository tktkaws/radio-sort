require "csv"

CSV.foreach('db/xml/TBSweekly加工済.csv', headers: true) do |row|
  Radio.create(
    title: row['title'],
    personality: row['pfm'],
    station: row['station'],
    start_time: row['ft'],
    end_time: row['title'],
    length: row['dur'],
    image: "TBS/#{row['filename']}",
    )
end

CSV.foreach('db/xml/LFRnotnill.csv', headers: true) do |row|
  Radio.create(
    title: row['title'],
    personality: row['pfm'],
    station: row['station'],
    start_time: row['ft'],
    end_time: row['title'],
    length: row['dur'],
    image: "LFR/#{row['filename']}",
    )
end

CSV.foreach('db/xml/FMJweeklynotnill.csv', headers: true) do |row|
  Radio.create(
    title: row['title'],
    personality: row['pfm'],
    station: row['station'],
    start_time: row['ft'],
    end_time: row['title'],
    length: row['dur'],
    image: "FMJ/#{row['filename']}",
    )
end

CSV.foreach('db/xml/TFMweekly加工済.csv', headers: true) do |row|
  Radio.create(
    title: row['title'],
    personality: row['pfm'],
    station: row['station'],
    start_time: row['ft'],
    end_time: row['title'],
    length: row['dur'],
    image: "TFM/#{row['filename']}",
    )
end

#femaleuser
50.times do |n|

  User.create!(email: "test#{n + 1}@example.com",
               password: "111111",
               name: Gimei.female.katakana,
               age: rand(1..5),
               gender: 2,
               image: File.open("#{Rails.root}/db/images/female/userimage#{rand(1..23)}.jpg")
  )
end

#maleuser
50.times do |n|
  User.create!(email: "test#{n + 51}@example.com",
               password: "111111",
               name: Gimei.male.katakana,
               age: rand(1..5),
               gender: 1,
               image: File.open("#{Rails.root}/db/images/male/userimage#{rand(1..15)}.jpg")
  )
end

100.times do |n|
  radio_ids = (1..700).to_a.sample(21)
  20.times do |i|
    if i >= 5
      point = 1
    else
      point =  10 - (i * 2)
    end

    Like.create!(user_id: n + 1,
                 radio_id: radio_ids[i],
                 row_order: i + 1,
                 point: point
    )
  end
end

50.times do |n|
  5.times do |i|
    follower_id = n + 1
    followed_id = n + i + 2
    Relation.create!(follower_id: follower_id,
                     followed_id: followed_id,
                     )
  end
end