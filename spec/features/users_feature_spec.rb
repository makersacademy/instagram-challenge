require 'rails_helper'

feature 'User can sign in and sign out' do

  context "user is not signed in and is on the homepage" do
    it "should see a login link and a register link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "should not see a logout link" do
      visit('/')
      expect(page).not_to have_link('Logout')
    end

  context "user signs in" do
    before do
      sign_up
    end

    it "should see a logout link" do
      visit('/')
      expect(page).to have_link("Logout")
    end

    it "should not have a login or register link" do
      visit('/')
      expect(page).not_to have_link("Login")
      expect(page).not_to have_link("Register")
    end
  end

  end
end
