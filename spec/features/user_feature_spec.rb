require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    scenario "should see 'Log in' and a 'sign up' link" do
      visit('/')
      expect(page).to have_content('Log in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on pictures page" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: '12345678')
      fill_in('Password confirmation', with: '12345678')
      click_button('Sign up')
    end

    scenario "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    scenario "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end