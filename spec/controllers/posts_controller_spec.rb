# frozen_string_literal: true
require 'pry'
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "::create" do
    let(:photo) {fixture_file_upload('files/uploads/bernard.jpg', 'image/jpeg')}
    context "authenicated user" do
      before(:each) do
        sign_in FactoryBot.create(:user)
        binding.pry
        post :create, params: {post: {photo: photo }}
      end
      it "adds a post to the database with " do
        expect(Post.last.photo).to eq photo
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
