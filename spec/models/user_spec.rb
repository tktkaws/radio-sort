require 'rails_helper'

RSpec.describe User, type: :system do
  #before(:all) do
  #  # 15.times {@user = create(:user)}
  #  15.times { @user = create(:user) do |u|
  #    u.tasks.create(attributes_for(:task))
  #  end
  #  }
  #  @user = create(:admin_user)
  #  2.times {@task = create(:admin_task)}
  #end
  #after(:all) do
  #  DatabaseCleaner.clean_with(:truncation)
  #end


  describe 'アカウント登録'do
    context 'ログイン成功' do
      fit 'ユーザー詳細ページに遷移すること' do
        visit new_user_registration_path
        fill_in 'session[email]', with: 'admin@test.com'
        fill_in 'session[password]', with: '111111'
        click_on 'commit'

        expect(page).to have_content '管理者権限'
      end

      end
      context 'ログイン失敗' do
        it 'エラーメッセージ””が表示されること' do
          expect(page).to have_content '管理者権限'
        end

      end