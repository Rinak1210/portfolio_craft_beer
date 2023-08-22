FactoryBot.define do
  factory :craft_beer_shop do
    name { "クラフトビール 店名" }
    address { "お店の住所" }
    description { "おすすめポイント" }
    user
  end
end
