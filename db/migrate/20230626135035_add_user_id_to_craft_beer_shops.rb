class AddUserIdToCraftBeerShops < ActiveRecord::Migration[6.1]
  def change
    add_column :craft_beer_shops, :user_id, :bigint#, foreign_key: true
  end
end
