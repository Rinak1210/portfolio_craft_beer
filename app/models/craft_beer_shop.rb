class CraftBeerShop < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
