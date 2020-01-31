100.times do |n|
  5.times do |i|
  Like.create!(user_id: n,
               radio_id: rand(1..200),
               )
  end
end