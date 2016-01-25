require 'rails_helper'

feature "users" do
  context "not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end
    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "signed in on the homepage" do
    before do
      user = create(:user)
      sign_in_as(user)
    end
    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end
    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
