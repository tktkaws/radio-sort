100.times do |n|
  20.times do |i|
    if i >= 5
      point = 1
    else
      point =  10 - (i * 2)
    end

    Like.create!(user_id: n,
               radio_id: rand(1..750),
               row_order: i + 1,
               point: point
  )
  end
end