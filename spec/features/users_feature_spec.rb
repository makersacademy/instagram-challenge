require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on homepage" do
    it "should see 'sign up' and 'sign in' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign in')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in and on the homepage" do

    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see 'sign up' and 'sign in' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign in')
    end
  end

end
