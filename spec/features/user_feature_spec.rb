require 'rails_helper'

feature "User can sign in and out" do

  context "user not signed in and on the homepage" do

    it "should see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end

  end

  context "user can sign up on the homepage" do

    before do
      visit('/')
      click_link('Sign up')
      fill_in('Username', with: 'test')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'sign in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Sign in')
      expect(page).not_to have_link('Sign up')
    end

  end

  context "signing up with invalid username" do

    before(:each) do
      visit('/')
      click_link('Sign up')
      fill_in('Email', with: 'test@example.com')
      fill_in('Password', with: 'testtest')
      fill_in('Password confirmation', with: 'testtest')
    end

    it "should error out when username left blank" do
      click_button('Sign up')
      expect(page).to have_content "Username can't be blank"
      expect(page).not_to have_content 'Welcome'
    end

    it "should error out when username is too short" do
      fill_in('Username', with: "T")
      click_button('Sign up')
      expect(page).to have_content "Username is too short"
      expect(page).not_to have_content 'Welcome'
    end

  end

end
