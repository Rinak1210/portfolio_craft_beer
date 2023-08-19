class SessionsController < ApplicationController
  before_action :login_required, only: [:destroy]

  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
      if user && user.authenticate(params[:password])
        log_in(user)
        flash[:notice] = "ログインしました"
        redirect_to craft_beer_shops_path
      else
        flash.now[:alert] = 'ログインに失敗しました'
        render 'new'
      end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました"
  end
end
