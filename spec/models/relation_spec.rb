require 'rails_helper'

RSpec.describe Relation, type: :model do
  before(:all) do
    2.times { @user = create(:user) }
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end
  describe 'バリデーション' do
    it 'follower/followeeが別のユーザーであればバリデーションが通る' do
      relation = Relation.new(follower_id: 1, followed_id: 2)
      expect(relation).to be_valid
    end
    it 'follower/followeeが同じユーザーであればバリデーションが通らない' do
      relation = Relation.new(follower_id: 1, followed_id: 1)
      expect(relation).to_not be_valid
    end
    it 'follower/followeeの組み合わせが既に存在していればバリデーションが通らない' do
      relation = Relation.new(follower_id: 1, followed_id: 2)
      relation.save
      relation2 = Relation.new(follower_id: 1, followed_id: 2)
      expect { relation2.save }.to raise_error(ActiveRecord::RecordNotUnique)
    end
  end
end
