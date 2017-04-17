require 'rails_helper'

feature "User can sign in and out" do
  context "User not signed in and on the homepage" do
    it "Should see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "Should not see a 'sign out' link" do
      visit '/'
      expect(page).not_to have_link('Sign out')
    end
  end

  context "User signed in on the homepage" do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@test.com')
      fill_in('Password', with: 'Password')
      fill_in('Password confirmation', with: 'Password')
      click_button('Sign up')
    end

    it "Should see a 'sign out' link" do
      visit '/'
      expect(page).to have_link('Sign out')
    end

    it "Should not see a 'sign in' link and a 'sign up' link" do
      visit '/'
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
