require 'rails_helper'

RSpec.describe "Sessions", type: :system do
  let!(:user) { FactoryBot.create(:user) }

  describe "ログイン" do
    context "ログインフォームに入力する値が正常" do
      it "ログインに成功" do
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: user.password
        click_button "ログイン"
        expect(current_path).to eq craft_beer_shops_path
        expect(page).to have_content "ログインしました"
      end
    end
    context "登録したものとは異なるメールアドレスを入力" do
      it "ログインに失敗" do
        visit login_path
        fill_in "メールアドレス", with: "test1@example.com"
        fill_in "パスワード", with: user.password
        click_button "ログイン"
        expect(current_path).to eq login_path
        expect(page).to have_content "ログインに失敗しました"
      end
    end
    context "パスワードを未入力のままログイン" do
      it "ログインに失敗" do
        visit login_path
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: nil
        click_button "ログイン"
        expect(current_path).to eq login_path
        expect(page).to have_content "ログインに失敗しました"
      end
    end
  end
end
