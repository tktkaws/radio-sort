require 'rails_helper'

#RSpec.describe Radio, type: :system do
#  before(:all) do
#    15.times { @user = create(:user) }
#    15.times { @radio = create(:radio) }
#    15.times { @like = create(:like) }
#  end
#  after(:all) do
#    DatabaseCleaner.clean_with(:truncation)
#    FactoryBot.reload
#  end
#
#  describe 'ラジオ検索' do
#    before do
#      visit radios_path
#    end
#    it '番組名(title1)で検索すると、title1が番組名に含まれたラジオのみが表示されること' do
#      fill_in 'q[title_cont]', with: 'title1'
#      click_on 'ラジオ検索'
#      expect(all('tbody tr').size).to eq(7)
#      expect(page).to_not have_content 'title2'
#      expect(page).to have_content 'title15'
#    end
#    it '番組名(title1),放送局(TBS)で検索すると、title1が番組名に含まれたTBSのラジオのみが表示されること' do
#      fill_in 'q[title_cont]', with: 'title1'
#      first('.dropdown-trigger').click
#      find('div.select-wrapper li', text: 'TBS').click
#      click_on 'ラジオ検索'
#      expect(all('tbody tr').size).to eq(3)
#      expect(page).to_not have_content 'title3'
#      expect(page).to_not have_content 'ニッポン放送'
#    end
#    it '番組名(title1),放送局(TBS),パーソナリティ(3)で検索すると、番組名にtitle1,パーソナリティに3が含まれたTBSのラジオのみが表示されること' do
#      fill_in 'q[title_cont]', with: 'title1'
#      fill_in 'q[personality_cont]', with: '3'
#      first('.dropdown-trigger').click
#      find('div.select-wrapper li', text: 'TBS').click
#      click_on 'ラジオ検索'
#      expect(all('tbody tr').size).to eq(1)
#      expect(page).to_not have_content 'J-wave'
#      expect(page).to have_content 'personality13'
#    end
#  end
#end
