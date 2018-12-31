require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:dummy_post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.build(:user) }

  describe "POST #create" do
    
    it "returns http success" do
      allow(Post).to receive(:find).and_return(dummy_post)
      allow(controller).to receive(:current_user).and_return(user)
      post :create
      expect(response).to redirect_to posts_url
    end
  end

end
