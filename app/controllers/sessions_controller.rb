class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
  end

  def create
    # まず、送られてきたメースアドレスでユーザーを検索する
    user = User.find_by(email: session_params[:email])

      # ユーザーが見つかった場合、送られてきたパスワードによる認証をauthenticateメソッドを使って行う
      if user&.authenticate(session_params[:password])
        # 認証に成功した場合に、セッションにuser_idを格納しています。
        session[:user_id]=user.id

        redirect_to root_path, notice: "ログインしました"

      else
        render :new
      end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "ログアウトしました"
  end
end
