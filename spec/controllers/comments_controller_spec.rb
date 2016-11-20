require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  describe "GET #new" do
    let(:user) { FactoryGirl.create(:user) }
    it "returns http success" do
      sign_in user
      Post.create(caption: "cool photo" )
      get :new, :post_id => 1
      expect(response).to have_http_status(:success)
    end
  end

end
