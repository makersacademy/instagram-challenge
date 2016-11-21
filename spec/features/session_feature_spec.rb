require 'rails_helper'

feature "User sessions" do

  context "When a user not signed in on the homepage" do
    it "should give the option to 'sign in' or 'sign up'" do
      visit('/')
      expect(page).to have_link('I Need MY InstaGratification')
      expect(page).to have_link('Sign in with Facebook')
      expect(page).to have_link('I Need InstaGratification')
    end

    it "should always have a profile picture of sorts" do
      visit('/')
      expect(page).not_to have_selector('img')
    end

    it "should not have a profile picture thumbnail" do
      visit('/')
      expect(page).not_to have_link('I\'ve Had Enough InstaGratification')
    end
  end

  context "When a user has signed in and is on the homepage" do

    before do
      sign_up_and_in('me@meemail.com', 'passwordy', 'Viola')
    end

    it "should give the option to 'sign out'" do
      visit('/')
      expect(page).to have_link('I\'ve Had Enough InstaGratification')
    end

    it "should not give the option to 'sign in' or 'sign up' again" do
      visit('/')
      expect(page).not_to have_link('I Need MY InstaGratification')
      expect(page).not_to have_link('Sign in with Facebook')
      expect(page).not_to have_link('I Need InstaGratification')
    end
  end
end
