require 'rails_helper'

feature 'users' do 
  context "user not signed in and on the homepage" do
    it "should see a 'log in' link and a 'sign up' link" do
      visit('/')
      expect(page).to have_link('Log in')
      expect(page).to have_link('Sign Up')
    end
  end
end