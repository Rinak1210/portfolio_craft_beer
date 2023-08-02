class AddUserIdToCraftBeerShops < ActiveRecord::Migration[6.1]
  def change
    add_reference :craft_beer_shops, :user, foreign_key: true #そのカラムに入ったidがデータに存在するかどうか
  end
end
