require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = create(:user)
    @radio = create(:radio)
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
  describe 'バリデーション' do
    context 'content' do
      c = 'c'
      it 'contentが1文字以上〜144文字以内であればバリデーションが通る' do
        comment = Comment.new(content: c * 144, user_id: 1, radio_id: 1)
        expect(comment).to be_valid
      end
      it 'contentが145文字以上であればバリデーションが通らない' do
        comment = Comment.new(content: c * 145, user_id: 1, radio_id: 1)
        expect(comment).to_not be_valid
      end
      it 'contentが0文字であればバリデーションが通らない' do
        comment = Comment.new(content: '', user_id: 1, radio_id: 1)
        expect(comment).to_not be_valid
      end
    end
  end
end
