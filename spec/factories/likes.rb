FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| n }
    sequence(:radio_id) { |n| n }
    #sequence(:radio_id, [1, 2, 3].cycle)
  end
end