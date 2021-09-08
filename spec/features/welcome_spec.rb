require 'rails_helper'

RSpec.describe "Welcome", :type => :feature do
 feature 'Welcome' do
    scenario "User visits site and welcome page is displayed" do
      visit '/'
      expect(page).to have_content('Welcome to Cheestagram')
    end
  end

 feature 'user wants to sign up' do
   scenario 'user clicks Sign up button' do
     visit '/'
     click_button('Sign up')
     expect(page).to have_content('Sign up')
   end
 end

 feature 'user wants to log in' do
   scenario 'user clicks Log in button' do
    visit '/'
    click_button('Log in')
    expect(page).to have_content('Email')
   end
  end
end
