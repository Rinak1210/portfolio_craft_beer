require 'rails_helper'

RSpec.describe CraftBeerShop, type: :model do
  let(:user) { FactoryBot.create(:user) }

  describe "バリデーション" do
    it "有効なデータであれば保存されること" do
      craft_beer_shop = CraftBeerShop.new(
        name: "クラフトビールショップ",
        description: "豊富な種類のクラフトビールが用意されています",
        address: "東京都千代田区有楽町",
        user_id: user.id
      )
      expect(craft_beer_shop).to be_valid
    end

    it "nameが入力されていなければ無効となること" do
      craft_beer_shop = CraftBeerShop.new(
        name: nil,
        description: "豊富な種類のクラフトビールが用意されています",
        address: "東京都千代田区有楽町",
        user_id: user.id
      )
      expect(craft_beer_shop).to be_invalid
      expect(craft_beer_shop.errors[:name]).to include("を入力してください")
    end

    it "descriptionが入力されていなければ無効となること" do
      craft_beer_shop = CraftBeerShop.new(
        name: "クラフトビールショップ",
        description: nil,
        address: "東京都千代田区有楽町",
        user_id: user.id
      )
      expect(craft_beer_shop).to be_invalid
      expect(craft_beer_shop.errors[:description]).to include("を入力してください")
    end
  end
end
