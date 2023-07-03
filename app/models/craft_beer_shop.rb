class CraftBeerShop < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true
end
