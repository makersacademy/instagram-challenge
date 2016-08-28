require 'rails_helper'

feature "User can sign in and out" do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' link and a 'sign up' link " do
      visit('/')
      expect(page).to have_link('Sign in')
      expect(page).to have_link('Sign up')
    end

    it "should not see a 'sign out' button" do
      visit('/')
      expect(page).not_to have_link('Sign out')
    end
  end


  context "user signed in and on the homepage" do
    before do
      visit('/')
      click_link('Sign up')
      fill_in 'Email', with: 'test@test.co.uk'
      fill_in 'Password', with: 'secret1234'
      fill_in 'Password confirmation', with: 'secret1234'
      click_button 'Sign up'
    end

    it "should see a 'sign out' link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not see a 'sign up' and a 'sign in' link" do
      visit '/'
      expect(page).not_to have_link('Sign up')
      expect(page).not_to have_link('Sign in')
    end
  end
end
