class ApplicationController < ActionController::Base
  helper_method :current_user

  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def login_required
    redirect_to login_path unless current_user
  end

  def require_author(craft_beer_shop)
    redirect_to root_path unless current_user && craft_beer_shop.user == current_user
  end
end
