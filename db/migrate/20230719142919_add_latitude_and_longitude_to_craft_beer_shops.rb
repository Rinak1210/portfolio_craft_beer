class AddLatitudeAndLongitudeToCraftBeerShops < ActiveRecord::Migration[6.1]
  def change
    add_column :craft_beer_shops, :latitude, :float
    add_column :craft_beer_shops, :longitude, :float
  end
end
