require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "Adds user to session if log in succesful" do
      user = User.create({ username: 'andy', email: 'andy@tester.com', password: '123456', password_confirmation: '123456' })
      post :create, params: { session: { email: 'andy@tester.com', password: '123456' } }
      expect(session[:user_id]).to eq user.id
    end
    it "Does not add user to session if log in unsuccesful" do
      user = User.create({ username: 'andy', email: 'andy@tester.com', password: '123456', password_confirmation: '123456' })
      post :create, params: { session: { email: 'andy@tester.com', password: '1234567' } }
      expect(session[:user_id]).to eq nil
    end
  end

end
