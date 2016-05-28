require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Sign in' link and a 'sign Up' link" do
      visit('/')
      expect(page).to have_link('Sign In')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign Out')
      expect(page).not_to have_link('New Picture')
      expect(page).not_to have_link('Account')
      expect(page).not_to have_link('My pictures')
    end
  end

  context "user signed in on the homepage" do
    before do
      sign_up_helper
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign Out')
      expect(page).to have_link('New Picture')
      expect(page).to have_link('Account')
      expect(page).to have_link('My pictures')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign In')
      expect(page).not_to have_link('Sign Up')
    end
  end
end