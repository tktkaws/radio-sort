require 'rails_helper'

RSpec.describe Comment, type: :system do
  before(:all) do
    @user = create(:user)
    @radio = create(:radio)
    @comment = create(:comment)
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'コメント機能'do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: '1@test.com'
      fill_in 'user[password]', with: '111111'
      click_on 'login'
    end
    it 'コメントが投稿されること' do
      visit radio_path(@user)
      fill_in "textarea1", with: "テストコメント"
      click_on '投稿'
      sleep 1
      expect(page).to have_content "テストコメント"
    end

    it 'コメントが削除されること' do
      visit radio_path(@user)
      find('#comments_area a[data-method=delete]').click
      sleep 1
      expect(page).to_not have_content "生涯ベスト"
    end
  end
end