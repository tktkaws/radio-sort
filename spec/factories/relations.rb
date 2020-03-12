FactoryBot.define do
  factory :relation do
    sequence(:follower_id) { |n| n }
    sequence(:followed_id) { |n| n + 1 }
  end
end
