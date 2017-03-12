require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it "renders the index template" do
      get :index
      expect(response).to have_http_status(:ok)
  end
end
