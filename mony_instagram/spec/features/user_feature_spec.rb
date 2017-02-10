require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and an 'sign up' link" do
      visit('/')
      expect(page).to have_content('Sign in')
      expect(page).to have_content('Sign up')
    end

    it "shoud not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_content('Sign out')
    end
  end

  context "user signed in on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: '123456')
      fill_in('Password confirmation', with: '123456')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_content('Sign out')
    end

    it "should not see 'sign in' link nor a 'sign up' link" do
      visit('/')
      expect(page).not_to have_content('Sign in')
      expect(page).not_to have_content('Sign up')
    end
  end

end
