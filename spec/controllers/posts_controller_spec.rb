# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let (:user) { FactoryBot.create(:user) }
  describe "::create" do
    let(:photo_dir) { "files/uploads/capybara.jpg" }
    let(:photo_full_dir) { Rails.root.join("spec", "fixtures", photo_dir) }
    let(:photo) { fixture_file_upload(photo_dir, 'image/jpeg') }
    context "authenicated user" do
      before(:each) do
        sign_in user
        post :create, params: { post: { photo: photo } }
      end
      it "adds a post to the database with correct photo" do
        expect(Post.last.photo.read).to eq File.open(photo_full_dir, "rb") { |f| f.read }
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
        sign_in user
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
  describe "::comment" do
    # context "authenicated user" do
    #   let (:factory_post) { FactoryBot.create(:post, user: user) }
    #   let (:comment_message) { "This is mock comment" }
    #   before(:each) do
    #     sign_in user
    #     post :comment, params: { comment: { message: comment_message }, post: factory_post, user: user }
    #   end
    #   it "should redirect to posts#index" do
    #     expect(response).to render_template(:index)
    #   end
    # end
    # context "unauthenicated user" do
    #   it "should redirect to login" do
    #     post :comment
    #     expect(response).to redirect_to '/users/sign_in'
    #   end
    # end
  end
end
