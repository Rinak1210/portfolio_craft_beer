FactoryBot.define do
  factory :craft_beer_shop do
    name { "お店の名前" }
    address { "お店の住所" }
    description { "おすすめポイント" }
    user
  end
end
