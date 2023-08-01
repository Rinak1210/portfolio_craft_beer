FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "User #{n}" } # 一意の名前を生成
    sequence(:email) { |n| "user#{n}@example.com" } # 一意のメールアドレスを生成
    password { "password" }
  end
end
