require 'rails_helper'

feature 'User can sign in and out' do

  context 'user not signed in and on the homepage' do
    scenario "should see a 'log in' link and a 'sign up' link" do
      visit '/'
      expect(page).to have_link('Sign up')
      expect(page).to have_link('Log in')
    end

    scenario "should not see the 'log out' link" do
      visit '/'
      expect(page).not_to have_link('Log out')
    end
  end

  context 'user signed in on the homepage' do
    before do
      visit '/'
      click_link('Sign up')
      fill_in('Email', with: 'test@email.com')
      fill_in('Password', with: '12345678')
      fill_in('Password confirmation', with: '12345678')
      click_button('Register')
    end

    scenario "should see 'log out' link" do
      visit '/'
      expect(page).to have_link('Log out')
    end

    scenario "should not see 'log in' and 'sign up' links" do
      visit '/'
      expect(page).not_to have_link('Log in')
      expect(page).not_to have_link('Sign up')
    end
  end

end