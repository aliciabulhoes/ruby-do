require 'rails_helper'

RSpec.describe "UserLists", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/user_lists/index"
      expect(response).to have_http_status(:success)
    end
  end

end
