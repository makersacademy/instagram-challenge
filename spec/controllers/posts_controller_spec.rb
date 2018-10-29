# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:each) do
    @user = create(:user)
    sign_in @user
    @post = build(:post)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST # new" do
    it "redirects to homepage" do
      post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id } }
      expect(response).to redirect_to(welcome_index_url)
    end

    it "creates new post" do
      post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id  } }
      expect(Post.find_by(description: @post.description)).to be
      expect {
          post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id } }
        }.to change(Post, :count).by(1)
    end
  end

  describe "GET #edit" do
    it 'routes /posts/1/edit to posts#edit' do
      expect(get: '/posts/1/edit').to route_to(
        controller: 'posts',
        action: 'edit',
        id: '1'
      )
    end
  end

  describe 'PATCH' do
    it 'updates posts' do
      post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id  } }
      post = Post.find_by(description: @post.description)
      new_description = 'Hello'
      patch :update, params: { post: { description: new_description, image: @post.image },id: post.id,  user_id: @user.id  }
      updated_post = Post.find_by(description: new_description)
      expect(updated_post.description).to eq(new_description)
      expect(updated_post.id).to eq(post.id)
    end

    it 'redirects to welcome_index_url after successfull updating' do
      post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id  } }
      post = Post.find_by(description: @post.description)
      new_description = 'Hello'
      patch :update, params: { post: { description: new_description, image: @post.image },id: post.id,  user_id: @user.id  }
      expect(response).to redirect_to(welcome_index_url)
    end
  end

  describe "DELETE #destroy" do
    it 'validate route DELETE /posts/:id to posts#destroy' do
      expect(delete: "/posts/1").to route_to(
        controller: "posts",
        action: "destroy",
        id: "1"
      )
    end

    it 'should delete own post' do
      post :create, params: { post: { description: @post.description, image: @post.image,  user_id: @user.id  } }
      new_post = Post.find_by(description: @post.description)
      new_post_id = new_post.id
      delete :destroy, params: { id: new_post_id }
      expect(Post.find_by(id: new_post_id)).to be_nil
    end
  end
end
