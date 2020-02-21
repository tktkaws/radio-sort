require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーション' do
    context 'name' do
      n = "n"
      it "nameが30文字以内であればバリデーションが通る" do
        user = User.new(name: n * 30 , email: "test@test.com", password: "111111", age: 1, gender: 1)
        expect(user).to be_valid
      end
      it "nameが31文字以上であればバリデーションが通らない" do
        user = User.new(name: n * 31 , email: "test@test.com", password: "111111", age: 1, gender: 1)
        expect(user).to_not be_valid
      end
    end
  end
end