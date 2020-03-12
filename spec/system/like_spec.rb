require 'rails_helper'

RSpec.describe Like, type: :system do
  before(:all) do
    5.times {@user = create(:user)}
    5.times {@radio = create(:radio)}
    5.times {@like = create(:like)}
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.reload
  end

  describe 'like(お気に入り)機能'do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: '1@test.com'
      fill_in 'user[password]', with: '111111'
      click_on 'login'
    end
    it 'likeされること' do
      visit radios_path
      find('#likes_buttons_2 a').click
      sleep 1
      expect(page).to have_selector '#likes_buttons_2', text: '2 Liked'
      expect(page).to_not have_selector '#likes_buttons_2', text: '1 Liked'
    end

    it 'likeが削除されること' do
      visit radios_path
      find('#likes_buttons_1 a').click
      sleep 1
        expect(page).to have_selector '#likes_buttons_1', text: '0 Liked'
      expect(page).to_not have_selector '#likes_buttons_1', text: '1 Liked'
    end
  end
end