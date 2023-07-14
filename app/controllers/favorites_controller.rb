class FavoritesController < ApplicationController
  before_action :set_craft_beer_shop

  # Ajax通信用
  def create
    current_user.favorites.new(craft_beer_shop_id: @craft_beer_shop.id).save
  end

  # Ajax通信用
  def destroy
    current_user.favorites.find_by(craft_beer_shop_id: @craft_beer_shop.id).destroy
  end

  private

  def set_craft_beer_shop
    @craft_beer_shop = CraftBeerShop.find(params[:craft_beer_shop_id])
  end
end
