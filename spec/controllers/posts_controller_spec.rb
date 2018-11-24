# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "::create" do
    context "authenicated user" do
      before(:each) do
        sign_in FactoryBot.create(:user)
        post :create, params: {post: {photo: 'Nice comment' }}
      end
      it "should add a add post to the database" do
        expect(Post.all.size).to eq 1
      end
      it "should redirect to posts#index" do
        expect(response).to redirect_to '/posts'
      end
    end
    context "unauthenicated user" do
      it "should redirect to login" do
        post :create
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
  describe "::index" do
    context "authenicated user" do
      before(:each) do
        sign_in FactoryBot.create(:user)
        get :index
      end
      it "should redirect to posts#index" do
        expect(response).to render_template(:index)
      end
    end
    context "unauthenicated user" do
      it "should redirect to login" do
        get :index
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end
end
