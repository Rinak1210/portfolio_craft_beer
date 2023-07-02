class SessionsController < ApplicationController
  before_action :login_required, only: [:destroy]

  def new
  end

  def create
    # まず、送られてきたメースアドレスでユーザーを検索する
    user = User.find_by(email: params[:email].downcase)
      # ユーザーが見つかった場合、送られてきたパスワードによる認証をauthenticateメソッドを使って行う
      if user && user.authenticate(params[:password])
        # ユーザー登録を行った際、同時にログイン処理も行うようにしています。
        log_in(user)
        flash[:notice] = "ログインしました"
        redirect_to profile_path(user)
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
      end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました"
  end
end
