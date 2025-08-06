require 'rails_helper'

RSpec.describe "Projects", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/projects/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/projects/show"
      expect(response).to have_http_status(:success)
    end
  end

end
