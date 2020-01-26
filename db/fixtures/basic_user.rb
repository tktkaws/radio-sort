100.times do |n|
  User.create!(email: "test#{n + 1}@example.com",
               password: "111111",
               name: Gimei.name.katakana,
               age: rand(1..5),
               gender: rand(1..2),
               )
end