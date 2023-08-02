require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    post login_path, params: { email: user.email, password: user.password }
  end

  describe "POST #create" do
    context "ログインに成功し投稿一覧ページにアクセスした際" do
      it "HTTPステータスコード302を返すこと" do
        expect(response).to have_http_status(302)
      end
    end
  end
end
