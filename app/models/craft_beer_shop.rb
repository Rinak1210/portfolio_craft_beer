class CraftBeerShop < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  # いいね機能のアソシエーション処理
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def already_favorited?(user_id)
    favorites.find_by(user_id: user_id)
  end
end
