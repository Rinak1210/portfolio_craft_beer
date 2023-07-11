class FavoritesController < ApplicationController
  before_action :set_craft_beer_shop

  # Ajax通信用
  def create
    @favorite = Favorite.new(user_id: current_user.id, craft_beer_shop_id: @craft_beer_shop.id)
    @favorite.save
  end

  # Ajax通信用
  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, craft_beer_shop_id: @craft_beer_shop.id)
    @favorite.destroy
  end

  private

  def set_craft_beer_shop
    @craft_beer_shop = CraftBeerShop.find_by(id: params[:craft_beer_shop_id])
  end
end
