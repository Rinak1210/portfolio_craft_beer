class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    #  ||=とは、左側の変数が既に値を持っている場合にはその値を保持し、持っていない場合に右側の値を代入する
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    # ユーザーがログインしていない限り、ログイン画面にリダイレクト
    redirect_to login_path unless current_user
  end
end
