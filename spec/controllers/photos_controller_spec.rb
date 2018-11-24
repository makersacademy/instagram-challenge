# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PhotosController, type: :controller do
  describe "::create" do
    context "authenicated user" do
      before(:each) do
        sign_in FactoryBot.create(:user)
        post :create
      end
      it "should add a add photo to the database" do
        expect(Photo.all.size).to eq 1
      end
      it "should redirect to photos#index" do
        expect(response).to redirect_to '/photos'
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
      it "should redirect to photos#index" do
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
