class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :craft_beer_shop

  validates :content, presence: true, length: { maximum: 30 }
end
