class SessionsController < ApplicationController
  before_action :login_required, only: [:destroy]

  def new
  end

  def create
    # まず、送られてきたメースアドレスでユーザーを検索する
    user = User.find_by(email: params[:email].downcase)
      # ユーザーが見つかった場合、送られてきたパスワードによる認証をauthenticateメソッドを使って行う
      if user && user.authenticate(params[:password])
        # 認証に成功した場合に、セッションにuser_idを格納しています。
        log_in(user)
        redirect_to profile_path(user), notice: "ログインしました"
      else
        flash.now[:danger] = 'ログインに失敗しました'
        render 'new'
      end
  end

  def destroy
    log_out
    redirect_to login_path, notice: "ログアウトしました"
  end
end
