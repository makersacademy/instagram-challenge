require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:dummy_post) { FactoryBot.create(:post) }

  describe "POST #create" do

    let(:user) { FactoryBot.create(:user) }

    def create_like
      allow(Post).to receive(:find).and_return(dummy_post)
      allow(controller).to receive(:current_user).and_return(user)
      post :create
    end

    it 'creates a like' do
      expect { create_like }.to change{ Like.count }.by(1)
    end

    it 'redirects to posts url' do
      create_like
      expect(response).to redirect_to posts_url
    end
  end

  describe "DELETE #destroy" do

    let!(:like) { FactoryBot.create(:like) }

    def delete_like
      allow(Post).to receive(:find).and_return(dummy_post)
      delete :destroy, params: { id: like.id }
    end

    it "deletes a like" do
      expect { delete_like }.to change { Like.count }.by(-1)
    end

  end

end
