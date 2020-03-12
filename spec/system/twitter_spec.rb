require 'rails_helper'

RSpec.describe Twitter, type: :system do
  before(:all) do
    5.times { @radio = create(:radio) }
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.reload
  end

  describe 'twitter投稿機能' do
    it 'twitterに投稿されること' do
      OmniAuth.config.mock_auth[:twitter] = nil
      Rails.application.env_config['omniauth.auth'] = twitter_mock

      visit new_user_session_path
      click_link 'Twitterログイン'

      visit radios_path
      find('#likes_buttons_2 a').click
      visit user_path(id: 1)
      click_on 'Twitterで共有する'
      click_on '投稿'
      expect(page).to have_content 'twitterに投稿しました'
    end
  end
end
