# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @post = create(:post)
  end

  describe "POST #new" do
    it "redirects to homepage" do
      post :create, params: { post_id: @post.id, user_id: @user.id  }
      expect(response).to redirect_to(welcome_index_url)
    end

    it "likes a post" do
      post :create, params: { post_id: @post.id, user_id: @user.id  }
      expect {
        post :create, params: { post_id: @post.id, user_id: @user.id  }
      }.to change(Like, :count).by(1)
    end
  end

  describe "DELETE #destroy" do
    it 'validate route DELETE /likes/:id to likes#destroy' do
      expect(delete: "posts/1/likes/1").to route_to(
        controller: "likes",
        action: "destroy",
        post_id: "1",
        id: "1"
      )
    end

    it "unlikes a post" do
      post :create, params: { post_id: @post.id, user_id: @user.id  }
      new_like = Like.find_by(post_id: @post.id, user_id: @user.id)
      new_like_id = new_like.id
      delete :destroy, params: { post_id: @post.id, id: new_like_id }
      expect(Like.find_by(id: new_like_id)).to be_nil
    end
  end
end
