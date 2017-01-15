require 'rails_helper'

feature "I, user, can sign up, in and out" do
  include Helpers

  user_1 = {
    email: 'pinkie@pie.me',
    password: 'cookiez'
  }

  context "I am not signed in and on the homepage" do
    it "should show the 'sign in' and 'sign up' links" do
      visit '/'
      expect(page).to have_link("Sign up")
      expect(page).to have_link("Sign in")
    end

    it "shouldn't show 'sign out' link" do
      visit '/'
      expect(page).not_to have_link("Sign out")
    end
  end

  context "I am signed in on the homepage" do
    before do
      sign_up(user_1)
    end
    it "should show the 'sign out' link" do
      expect(page).to have_link("Sign out")
    end
    it "shouldn't show 'sign up' and 'sign in' links" do
      expect(page).not_to have_link("Sign up")
      expect(page).not_to have_link("Sign in")
    end
  end
end
