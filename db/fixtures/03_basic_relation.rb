50.times do |n|
  5.times do |i|
      Relation.create!(follower_id: n,
                       followed_id: n + i,
                   )
    end
end