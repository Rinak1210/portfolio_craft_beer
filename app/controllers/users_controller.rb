class UsersController < ApplicationController
  before_action :login_required, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to profile_path(@user)
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @craft_beer_shops = @user.craft_beer_shops
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to profile_path(@user), notice: "ユーザー情報を更新しました"
    else
      flash[:notice] = @user.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to signup_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
