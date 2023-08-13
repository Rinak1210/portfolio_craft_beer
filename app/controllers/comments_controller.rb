class CommentsController < ApplicationController
  # Ajax通信用
  def create
    @craft_beer_shop = CraftBeerShop.find(params[:craft_beer_shop_id])
    @comment = current_user.comments.new(comment_params)
    @comment.craft_beer_shop_id = @craft_beer_shop.id
    if @comment.save
      flash.now[:notice] = 'コメントを投稿しました'
      render :index
    else
      render :error
    end
  end

  # Ajax通信用
  def destroy
    Comment.find_by(id: params[:id], craft_beer_shop_id: params[:craft_beer_shop_id]).destroy
    flash.now[:alert] = '投稿を削除しました'
    #renderしたときに@craft_beer_shopのデータがないので@craft_beer_shopを定義
    @craft_beer_shop = CraftBeerShop.find(params[:craft_beer_shop_id])
    render :index
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :craft_beer_shop_id)
  end
end
