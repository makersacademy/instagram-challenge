require 'rails_helper'

feature 'Users feature' do

  context "creating new user" do
    it "by fill in form after pressing 'Sign up' button " do
      visit('/')
      sign_up_user
      expect(page).to have_content('Welcome!
                        You have signed up successfully.')
    end

    it "should show error if username is less then 4 chars" do
      visit('/')
      sign_up_user(username: 'tes')
      expect(page).to have_content 'Username is too short
                                (minimum is 4 characters)'
      expect(page).not_to have_content('Welcome!
                        You have signed up successfully.')
    end

    it "should show error if this username is already exist" do
      visit('/')
      sign_up_user
      click_link('Sign out')
      sign_up_user(username: 'test', email: 'test1@example.com')
      expect(page).to have_content ('Username has already been taken')
      expect(page).not_to have_content('Welcome!
        You have signed up successfully.')
    end
  end

  context "login/logout existing user/" do
    before do
      visit('/')
      sign_up_user
    end

    it "should be able to 'log in' and see 'sign out" do
      click_link('Sign out')
      log_in_user
      expect(page).to have_content("Signed in successfully.")
      expect(page).to have_content("Sign out")
      expect(page).not_to have_content("Log in")
      expect(page).not_to have_content("Sign up")
    end

    it "should be able to 'sign out' and see 'log in" do
      click_link('Sign out')
      expect(page).to have_content("Signed out successfully.")
      expect(page).not_to have_content("Sign out")
      expect(page).to have_content("Log in")
      expect(page).to have_content("Sign up")
    end
  end

  context "if user isn't logged in" do
    it "should see a 'log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign up')
    end

    it "should not see 'sign out' link" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end

  context "if user is logged in" do
    before do
      visit('/')
      sign_up_user
    end

    it "should see 'sign out' link" do
      visit('/')
      expect(page).to have_link('Sign out')
    end

    it "should not see a 'log in' link and a 'sign up' link" do
      visit('/')
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end

end