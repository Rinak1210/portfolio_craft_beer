FactoryBot.define do
  factory :comment do
    content { "MyText" }
    user { nil }
    craft_beer_shop { nil }
  end
end
