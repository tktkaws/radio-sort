FactoryBot.define do
  factory :radio,class: Radio do
    sequence(:title) { |n| "title#{n}"}
    sequence(:personality) { |n| "personality#{n}"}
    sequence(:station, ["TBS", "J-wave", "ニッポン放送"].cycle)
    start_time { "2020-02-03 05:00:00" }
    length { 3600 }
  end
end