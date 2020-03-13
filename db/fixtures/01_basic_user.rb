# femaleuser
50.times do |n|
  User.create!(email: "test#{n + 1}@example.com",
               password: '111111',
               name: Gimei.female.katakana,
               age: rand(1..5),
               gender: 2,
               image: File.open("#{Rails.root}/db/images/female/userimage#{rand(1..23)}.jpg"))
end

# maleuser
50.times do |n|
  User.create!(email: "test#{n + 51}@example.com",
               password: '111111',
               name: Gimei.male.katakana,
               age: rand(1..5),
               gender: 1,
               image: File.open("#{Rails.root}/db/images/male/userimage#{rand(1..15)}.jpg"))
end
