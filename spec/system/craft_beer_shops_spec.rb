require 'rails_helper'

RSpec.describe 'CraftBeerShops', type: :system do
  let(:user) { create(:user) }
  let!(:craft_beer_shop) { create(:craft_beer_shop) }

  before do
    visit login_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end

  describe '投稿一覧ページ' do
    it 'クラフトビール 店名をクリックすると詳細ページにアクセスできること' do
      visit craft_beer_shops_path
      click_on craft_beer_shop.name

      expect(current_path).to eq(craft_beer_shop_path(craft_beer_shop))
      expect(page).to have_content(craft_beer_shop.name)
      expect(page).to have_content(craft_beer_shop.address)
      expect(page).to have_content(craft_beer_shop.description)
    end
  end
end
