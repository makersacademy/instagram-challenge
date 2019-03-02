# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:dummy_post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }

  describe "POST #create" do
    def create_like
      allow(Post).to receive(:find).and_return(dummy_post)
      allow(controller).to receive(:current_user).and_return(user)
      post :create
    end

    it "creates a like" do
      expect { create_like }.to change { Like.count }.by(1)
    end

    it "redirects to posts url" do
      create_like
      expect(response).to redirect_to post_path(dummy_post)
    end
  end

  describe "DELETE #destroy" do
    let!(:like) { FactoryBot.create(:like) }

    def delete_like
      allow(Post).to receive(:find).and_return(dummy_post)
      allow_any_instance_of(LikesController).to receive(:already_liked?).and_return(true)
      delete :destroy, params: { id: like.id }
    end

    it "deletes a like" do
      expect { delete_like }.to change { Like.count }.by(-1)
    end

    it "redirects to posts url" do
      delete_like
      expect(response).to redirect_to post_path(dummy_post)
    end
  end
end
