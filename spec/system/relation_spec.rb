require 'rails_helper'

# RSpec.describe Relation, type: :system do
#   before(:all) do
#     5.times { @user = create(:user) }
#     4.times { @relation = create(:relation) }
#   end
#   after(:all) do
#     DatabaseCleaner.clean_with(:truncation)
#     FactoryBot.reload
#   end
#
#   describe 'フォロー機能' do
#     before do
#       visit new_user_session_path
#       fill_in 'user[email]', with: '1@test.com'
#       fill_in 'user[password]', with: '111111'
#       click_on 'login'
#     end
#     it 'フォローすること' do
#       visit users_path
#       find('#follow_form_3 button').click
#       sleep 1
#       expect(page).to have_selector '#follow_form_3', text: '解除'
#       expect(page).to_not have_selector '#follow_form_3', text: 'フォロー'
#     end
#
#     it 'フォロー解除すること' do
#       visit users_path
#       find('#follow_form_2 button').click
#       sleep 1
#       expect(page).to have_selector '#follow_form_3', text: 'フォロー'
#       expect(page).to_not have_selector '#follow_form_3', text: '解除'
#     end
#   end
# end
