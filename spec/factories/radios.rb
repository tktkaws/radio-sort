FactoryBot.define do
  factory :radio, class: Radio do
    sequence(:title) { |n| "title#{n}" }
    sequence(:personality) { |n| "personality#{n}" }
    sequence(:station, %w[TBS J-wave ニッポン放送].cycle)
    start_time { '2020-02-03 05:00:00' }
    length { 3600 }
    sequence(:image) { |n| "/assets/images/fixtures/radiosample#{n}.jpg" }

    # image {'/assets/images/fixtures/radiosample1.jpg'}
    #
    #
    # image_1 '/assets/images/test_image.jpeg'
    # image_2 '/assets/images/test_image.jpeg'
    # image_3 '/assets/images/test_image.jpeg'
    # image_4 '/assets/images/test_image.jpeg'
    # image_5 '/assets/images/test_image.jpeg'
    # /Users/takayukitakahashi/RubymineProjects/radio-sort/app/assets/images/fixtures/radiosample1.jpg
    # image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/radiosample1.jpg')) }
    # image { [ Rack::Test::UploadedFile.new(Rails.root.join('images/fixtures/radiosample1.jpg')) ] }  #json型で画像を保存するときは[]でデータを囲む・配列にしていないと入力エラーが発生する
  end
end
