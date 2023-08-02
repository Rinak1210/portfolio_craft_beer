require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before do
    post login_path, params: { email: user.email, password: user.password }
  end

  describe "POST #create" do
    context "ログインに成功し投稿一覧ページにアクセスした際" do
      it "HTTPステータスコード200を返すこと" do
        #follow_redirect!
        expect(response).to have_http_status(200)
      end
    end
  end
end
