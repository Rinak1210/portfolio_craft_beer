class CraftBeerShop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def already_favorited?(user_id)
    favorites.find_by(user_id: user_id)
  end
end
