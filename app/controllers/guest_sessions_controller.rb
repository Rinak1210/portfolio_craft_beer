class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
      session[:user_id] = user.id
      flash[:notice] = "ゲストユーザーとしてログインしました"
      redirect_to craft_beer_shops_path
  end
end
