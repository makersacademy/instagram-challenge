require 'rails_helper'
require_relative '../support/users_controller_helper_spec.rb'

RSpec.describe UsersController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #create" do

    let(:dummy_user) { FactoryBot.build(:user) }

    it "returns redirects to /posts if user created" do
      valid_post_by(dummy_user)
      expect(response).to redirect_to posts_path
    end

    it "creates a new user account with valid attributes" do
      expect { valid_post_by(dummy_user) }.to change { User.count }.by(1)
      user = User.last
      expect(user.first_name).to eq dummy_user.first_name
      expect(user.last_name).to eq dummy_user.last_name
      expect(user.username).to eq dummy_user.username
      expect(user.email).to eq dummy_user.email
    end

    it "redirects to sign up if invalid params" do
      invalid_post
      expect(response).to redirect_to sign_up_url
    end

    it "won't create an account if invalid params" do
      expect { invalid_post }.not_to change { User.count }
    end
  end

end
