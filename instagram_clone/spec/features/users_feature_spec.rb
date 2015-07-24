require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'log in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign Up')
    end

    it "should not see 'log out' link" do
      visit '/'
      expect(page).not_to have_link('Log out')
    end
  end

  context "user logged in on the homepage" do
    before do
      visit '/'
      click_link('Sign Up')
      fill_in('Email', with: 'lucy@mail.com')
      fill_in('Password', with: 'starwars')
      fill_in('Password confirmation', with: 'starwars')
      click_button('Sign up')
    end

    it "should see 'log out' link" do
      visit '/'
      expect(page).to have_link('Log out')
    end

    it "should not see a 'log in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign Up')
    end
  end
end
