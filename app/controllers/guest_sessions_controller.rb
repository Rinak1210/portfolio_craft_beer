class GuestSessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: "guest@exapmle.com") do |user|
      #password = SecureRandom.urlsafe_base64
      user.password = "password"
      user.password_confirmation = "password"
      user.name = "ゲストユーザー"
    end
    log_in(user)
    flash[:notice] = "ゲストユーザーとしてログインしました"
    redirect_to craft_beer_shops_path
  end
end
