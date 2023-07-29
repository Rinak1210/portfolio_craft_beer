require 'rails_helper'

RSpec.describe User, type: :system do
  let!(:user) { FactoryBot.create(:user) }
  # let(:user) { create(:user) }

  describe "ユーザー新規登録" do
    context "フォームに入力する値が正常" do
      it "ユーザー新規登録に成功" do
        expect {
          visit signup_path
          fill_in "ユーザーネーム", with: "user1"
          fill_in "メールアドレス", with: "test1@example.com"
          fill_in "パスワード", with: "password1"
          fill_in "パスワード(確認)", with: "password1"
          click_on "登録"
          expect(current_path).to eq craft_beer_shops_path
          expect(page). to have_content "ユーザー登録に成功しました"
        }.to change(User, :count).by(1)
      end
    end
    context "メールアドレスが未記入" do
      it "ユーザーの新規登録に失敗" do
        visit signup_path
        fill_in "ユーザーネーム", with: "user2"
        fill_in "メールアドレス", with: nil
        fill_in "パスワード", with: "password2"
        fill_in "パスワード(確認)", with: "password2"
        click_button "登録"
        expect(current_path).to eq signup_path
        expect(page). to have_content "Emailを入力してください"
      end
    end
    context "記入したメールアドレスが既に登録されている" do
      it "ユーザーの新規登録に失敗" do
        visit signup_path
        fill_in "ユーザーネーム", with: "user3"
        fill_in "メールアドレス", with: user.email
        fill_in "パスワード", with: "password3"
        fill_in "パスワード(確認)", with: "password3"
        click_button "登録"
        expect(current_path).to eq signup_path
        expect(page). to have_content "Emailはすでに存在します"
      end
    end
  end
end
