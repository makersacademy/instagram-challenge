require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Register')
      fill_in('Email', with: 'test1@hotmail.com')
      fill_in('User name', with: 'test1')
      fill_in('Password', with: 'password')
      fill_in('Password confirmation', with: 'password')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Logout')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Register')
    end
  end
end