class CraftBeerShopsController < ApplicationController
  before_action :login_required, only: [:new, :create, :edit, :update, :destroy]
  skip_before_action :login_required, only: [:index]

  def index
    @craft_beer_shops =  CraftBeerShop.all#.includes(:user)
  end

  def new
    @craft_beer_shop = CraftBeerShop.new
  end

  def create
    if current_user
      @craft_beer_shop = current_user.craft_beer_shops.new(craft_beer_shop_params)
      if @craft_beer_shop.save
        redirect_to craft_beer_shops_path, notice: "投稿に成功しました"
      else
        render action: :new
      end
    else
      redirect_to login_path, notice: "ログインしてください"
    end
  end

  def show
    @craft_beer_shop = CraftBeerShop.find(params[:id])
    @comment = Comment.new
    # 新着順で表示
    @comments = @craft_beer_shop.comments.order(created_at: :desc)
  end

  def edit
    @craft_beer_shop = CraftBeerShop.find(params[:id])
  end

  def update
    @craft_beer_shop = CraftBeerShop.find(params[:id])
    if @craft_beer_shop.update(craft_beer_shop_params)
      flash[:notice] = "更新しました"
      redirect_to craft_beer_shops_path(@craft_beer_shop)
    else
      render action: :edit
    end
  end

  def destroy
    @craft_beer_shop = CraftBeerShop.find(params[:id])
    if @craft_beer_shop.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to profile_path(current_user.id)
    else
      flash.now[:danger] = "削除に失敗しました"
      render action: :index
    end
  end

  private

  def craft_beer_shop_params
    params.require(:craft_beer_shop).permit(:name, :address, :description, images: [])
  end
end
