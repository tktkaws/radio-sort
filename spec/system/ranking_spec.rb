require 'rails_helper'

RSpec.describe Radio, type: :system do
  before(:all) do
    100.times {@user = create(:user)}
    10.times {@radio = create(:radio)}
    100.times {@like = create(:ranking_like)}
  end
  after(:all) do
    DatabaseCleaner.clean_with(:truncation)
  end

  describe 'ランキング機能'do
    before do
      visit ranking_path
    end
    it '絞り込みをしない場合、番組名(title10)が１位として表示されること' do
      tr = page.all("td", text: "title10").first.find(:xpath,"..")
      expect(tr).to have_content '1位'
      expect(tr).to have_content '100pt'
    end
    it '男性で絞り込んだ場合、番組名(title10)が１位ではなくなること' do
      all('.dropdown-trigger')[1].click
      find('div.select-wrapper li', text: '男性').click
      click_on '絞り込み'
      tr = page.all("td", text: "title10").first.find(:xpath,"..")
      expect(tr).to_not have_content '1位'
    end
    it '10代で絞り込んだ場合、番組名(title10)のポイントが100ptではなくなること' do
      all('.dropdown-trigger')[2].click
      find('div.select-wrapper li', text: '10代').click
      click_on '絞り込み'
      tr = page.all("td", text: "title10").first.find(:xpath,"..")
      expect(tr).to_not have_content '100pt'
    end
  end
end
