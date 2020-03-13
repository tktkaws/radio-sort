require 'rails_helper'

RSpec.describe User, type: :system do
  before(:all) do
    15.times { @user = create(:user) }
    15.times { @radio = create(:radio) }
    15.times { @like = create(:like) }
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
    FactoryBot.reload
  end

  describe 'アカウント登録' do
    it 'ユーザー詳細ページに遷移すること' do
      visit new_user_registration_path
      fill_in 'user[email]', with: 'rspec@test.com'
      fill_in 'user[password]', with: '111111'
      fill_in 'user[password_confirmation]', with: '111111'
      click_on 'save'
      expect(page).to have_content 'ラジオをお気に入りに登録してみましょう'
    end
  end

  describe 'ログイン' do
    context '通常ログイン' do
      it 'ユーザー詳細ページに遷移すること' do
        visit new_user_session_path
        fill_in 'user[email]', with: '1@test.com'
        fill_in 'user[password]', with: '111111'
        click_on 'login'
        expect(page).to have_content 'Twitterで共有する'
      end
    end

    context 'ゲストログイン' do
      it 'ユーザー詳細ページに遷移すること' do
        visit new_user_session_path
        click_on 'ゲスト ログイン'
        expect(page).to have_content 'ラジオをお気に入りに登録してみましょう'
      end
    end

    context 'Twitterログイン' do
      it 'ユーザー詳細ページに遷移すること' do
        OmniAuth.config.mock_auth[:twitter] = nil
        Rails.application.env_config['omniauth.auth'] = twitter_mock

        visit new_user_session_path
        click_link 'Twitterログイン'
        expect(page).to have_content 'ラジオをお気に入りに登録してみましょう'
      end
    end
  end

  describe 'ログイン後' do
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: '1@test.com'
      fill_in 'user[password]', with: '111111'
      click_on 'login'
    end
    context '編集' do
      it 'ユーザー詳細ページに変更した情報が表示されること' do
        first(:link, '編集').click
        fill_in 'user[name]', with: 'name'
        first('.dropdown-trigger').click
        find('div.select-wrapper li', text: '10代').click
        all('.dropdown-trigger')[1].click
        find('div.select-wrapper li', text: '女性').click
        click_on '更新'

        expect(page).to have_content 'name'
        expect(page).to have_content '女性'
        expect(page).to have_content '10代'
        expect(page).to_not have_content '男性'
        expect(page).to_not have_content '20代'
      end
    end

    context 'ログアウト' do
      it 'ログアウトリンクを押すと、TOPページに遷移すること' do
        first(:link, 'ログアウト').click

        expect(page).to have_content 'ログアウトしました。'
      end
    end
    context '退会' do
      it '退会リンクを押すと、TOPページに遷移すること' do
        first(:link, '編集').click
        click_on '退会'
        page.accept_confirm '本当に退会しますか?'
        expect(page).to have_content 'アカウントを削除しました。'
      end
    end
    context 'user検索' do
      it '性別(男性)で検索すると、男性のユーザーのみが表示されること' do
        visit users_path
        first('.dropdown-trigger').click
        find('div.select-wrapper li', text: '男性').click
        click_on 'ユーザー検索'

        expect(page).to_not have_content '女性'
        expect(page).to have_content '男性'
      end
      it '年齢(10代)で検索すると、10代のユーザーのみが表示されること' do
        visit users_path
        all('.dropdown-trigger')[1].click
        find('div.select-wrapper li', text: '10代').click
        click_on 'ユーザー検索'

        expect(page).to_not have_content '20代'
        expect(page).to have_content '10代'
      end
      it '好きな番組(title15)で検索すると、title15をlikeしたユーザーのみが表示されること' do
        visit users_path

        fill_in 'q[likes_radio_title_cont_all]', with: 'title15'
        click_on 'ユーザー検索'
        expect(page).to have_selector 'ul.collection', text: 'title15'
        expect(page).to_not have_content 'title14'
      end
    end
  end
end
