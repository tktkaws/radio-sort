50.times do |n|
  5.times do |i|
    follower_id = n + 1
    followed_id = n + i + 2
    Relation.create!(follower_id: follower_id,
                     followed_id: followed_id)
  end
end
