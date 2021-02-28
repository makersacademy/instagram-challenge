require 'rails_helper'

RSpec.describe 'User registration', type: :system do

  describe 'registration page' do
    it "returns HTTP success" do
      get "/users/new"
      expect(response).to have_http_status(:success)
    end

    it "allows users to register to binstagram" do
      visit("/users/new")
      fill_in "Name", with: "User"
      fill_in "Email", with: "test@email.com"
      click_button "Submit"
      expect(page).to have_content("Welcome to Binstagram!")
    end
  end
end
