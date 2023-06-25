class CreateCraftBeerShops < ActiveRecord::Migration[6.1]
  def change
    create_table :craft_beer_shops do |t|
      t.string :name, null: false
      t.string :address
      t.text :description, null: false

      t.timestamps
    end
  end
end
