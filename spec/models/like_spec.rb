require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = create(:user)
    2.times { @radio = create(:radio) }
    @like = create(:like)
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
  describe 'バリデーション' do
    it 'userとradioの組み合わせが存在していなければバリデーションが通る' do
      like2 = Like.new(user_id: 1, radio_id: 2)
      expect(like2).to be_valid
    end
    it 'userとradioの組み合わせが存在していればバリデーションが通らない' do
      like = Like.new(user_id: 1, radio_id: 1)
      expect { like.save }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
