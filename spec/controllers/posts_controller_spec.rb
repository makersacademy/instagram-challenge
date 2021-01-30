require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "GET /posts" do
    it "returns 200 ok" do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end
end
