class CraftBeerShop < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many_attached :images

  # いいね機能のアソシエーション処理
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user

  # addressの文字列から自動で緯度と経度のカラムに値を代入
  geocoded_by :address
  # addressカラムに値が代入される時（createとupdate）に、緯度と経度を住所から変換してくれる
  after_validation :geocode, if: :address_changed?

  validates :name, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  def already_favorited?(user_id)
    favorites.find_by(user_id: user_id)
  end
end
