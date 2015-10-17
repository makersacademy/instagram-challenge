require 'rails_helper'

feature "user signing in and out" do
  context "user not signed in and on the homepage" do
    scenario "should have 'sign in' link and 'sign up' link" do
      visit('/photos')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    scenario "should not have 'sign out' link" do
      visit('/photos')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/photos')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    scenario "should have 'sign out' link" do
      visit('/photos')
      expect(page).to have_link('Sign out')
    end

    scenario "should not have 'sign in' link and 'sign up' link" do
      visit('/photos')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
