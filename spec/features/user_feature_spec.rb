require 'helpers/user_helpers'
require 'rails_helper'

include UserHelpers

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "I see a 'sign in' link and a 'sign up' link" do
      visit pictures_path
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "I cannot see 'sign out' link" do
      visit pictures_path
      expect(page).not_to have_link('Sign out')
    end
  end

  context "I am able to sign up from the homepage" do
    before do
      user = build(:user)
      visit pictures_path
      sign_up(user.email, user.password)
    end

    it "I can see 'sign out' link when I am signed in" do
      visit pictures_path
      expect(page).to have_link('Sign out')
    end

    it "I cannot see a 'sign in' link and a 'sign up' link when I am already signed in" do
      visit pictures_path
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
