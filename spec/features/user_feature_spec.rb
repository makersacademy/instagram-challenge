require 'rails_helper'

feature "User can sign in and out" do
  before(:each) do
    visit('/')
  end
  context "user not signed in and on the homepage" do

    it "should see a 'sign in' link and a 'sign up' link" do
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      expect(page).not_to have_link('Sign out')
    end

    it "should not let pictures be posted" do
      click_link 'New Post'
      expect(page).to have_content("You need to sign in or sign up before continuing.")
    end
  end

  context "user signed in on the homepage" do
    before do
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end
  end
end
