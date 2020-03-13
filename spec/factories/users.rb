FactoryBot.define do
  factory :user, class: User do
    sequence(:email) { |n| "#{n}@test.com" }
    password { '111111' }
    sequence(:age, [0, 1, 2, 3, 4, 5].cycle)
    sequence(:gender, [0, 1, 2].cycle)
  end
end
