require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'Login' link and a 'Register' link" do
      visit('/')
      expect(page).to have_link('Login')
      expect(page).to have_link('Register')
    end

    it "should not see 'Logout' link" do
      visit('/')
      expect(page).not_to have_link('Logout')
    end
  end

  context "user 'Register' on the homepage" do
    before do
      visit('/')
      click_link('Register')
      fill_in('Email', with: 'test@example.com')
      fill_in('User name', with: 'test')
      fill_in('Password', with: 'testtest', match: :first)
      fill_in('Password confirmation', with: 'testtest')
      click_button('Sign up')
    end

    it "should see 'Logout' link" do
      visit('/')
      expect(page).to have_link('Logout')
    end

    it "should not see a 'Login' link and a 'Register' link" do
      visit('/')
      expect(page).not_to have_link('Login')
      expect(page).not_to have_link('Register')
    end
  end
end
