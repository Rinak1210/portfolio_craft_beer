class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :craft_beer_shop
end
