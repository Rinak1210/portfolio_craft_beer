class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :craft_beer_shop

  validates_uniqueness_of :craft_beer_shop_id, scope: :user_id
end
