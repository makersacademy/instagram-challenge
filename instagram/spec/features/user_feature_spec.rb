require 'rails_helper'

feature 'User can sign in, out and sign up' do

  context 'user not signed in and on the homepage' do
    scenario 'should see sign in and sign up links' do
      visit '/'
      expect(page).to have_link 'Login'
      expect(page).to have_link 'Register'
    end

    scenario 'should not see sign out link' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context 'user signing up and in' do
    xscenario 'user can sign up' do
      visit '/'
      click_link 'Register'
      fill_in 'User name', with: 'tester'
      fill_in 'Email', with: 'test@live.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Register'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    scenario 'should see sign out link' do
      visit '/'
      sign_in
      expect(page).to have_link 'Sign out'
    end

    scenario 'user should see a new post link' do
      visit '/'
      sign_in
      expect(page).to have_link 'New Post'
    end
  end

end
