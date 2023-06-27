class User < ApplicationRecord
  has_many :craft_beer_shops, dependent: :destroy

  before_save { self.email = email.downcase }
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password,presence: true, length: { maximum: 10 }
  has_secure_password
end
