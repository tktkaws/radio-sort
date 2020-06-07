require 'rails_helper'

RSpec.describe Like, type: :system do
  before(:all) do
    5.times { @user = create(:user) }
    5.times { @radio = create(:radio) }
    5.times { @like = create(:like) }
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.reload
  end

  describe 'お気に入り機能' do
    before do
      visit new_user_session_path
      pry
      fill_in 'user[email]', with: '1@test.com'
      fill_in 'user[password]', with: '111111'
      click_on 'login'
    end
    it 'お気に入りに入ること' do
      visit radios_path
      pry
      find('#likes_buttons_2 a').click
      sleep 1
      tr = page.all('td', text: 'title2').first.find(:xpath, '..')
      expect(tr).to have_content '解除'
      expect(tr).to_not have_content 'お気に入り'
    end

    it 'お気に入りが解除されること' do
      visit radios_path
      find('#likes_buttons_1 a').click
      sleep 1
      tr = page.all('td', text: 'title1').first.find(:xpath, '..')
      expect(tr).to have_content 'お気に入り'
      expect(tr).to_not have_content '解除'
    end
  end
end
