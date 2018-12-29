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

    let(:user) { FactoryBot.build(:user) }

    it "returns redirects to /posts if user created" do
      valid_post
      expect(response).to redirect_to posts_path
    end

    it "creates a new user account with valid attributes" do
      expect { valid_post }.to change { User.count }.by(1)
      user = User.last
      expect(user.first_name).to eq "Joe"
      expect(user.last_name).to eq "Bloggs"
      expect(user.username).to eq "JoeyB"
      expect(user.email).to eq "joe@gmail.com"
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
