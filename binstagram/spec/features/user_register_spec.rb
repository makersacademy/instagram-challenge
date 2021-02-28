require 'rails_helper'

RSpec.describe 'User registration', type: :system do

  describe 'registration page' do
    it "returns HTTP success" do
      get "/users/sign_up"
      expect(response).to have_http_status(:success)
    end

    it "allows users to register to binstagram" do
      visit("/users/sign_up")
      fill_in :email, with: "test@email.com"
      fill_in :password, with: 'password'
      fill_in :password_confirmation, with: 'password'
      click_button "Sign up"
      expect(page).to have_content("Welcome to Binstagram!")
    end
  end
end
