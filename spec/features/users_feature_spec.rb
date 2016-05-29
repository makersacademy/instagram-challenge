require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'login' link" do
      visit('/')
      expect(page).to have_link('Login')
    end

    it "in the login page should have a signup link" do
      visit('/users/sign_in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage via signup" do
    before do
      sign_up
    end
    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Logout')
    end

    it "should not see a 'Login' link and a 'Sign up' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Sign up')
    end
  end
end