require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link " do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see a 'sign out' button" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end


  context "user signed in and on the homepage" do
    before do
      sign_up
    end

    it "should see a 'sign out' link" do
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign up' and a 'sign in' link" do
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in')
    end
  end
end
