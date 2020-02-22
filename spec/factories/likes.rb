FactoryBot.define do
  factory :like do
    sequence(:user_id) { |n| n }
    sequence(:radio_id) { |n| n }
    #sequence(:radio_id, [1, 2, 3].cycle)
  end

  factory :ranking_like,class: Like do
    radio_ids = (1..10).to_a
    points = (1..10).to_a
    sequence(:user_id) { |n| n }
    sequence(:radio_id, radio_ids.cycle)
    sequence(:point, points.cycle)
  end

end