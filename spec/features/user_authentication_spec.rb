require 'rails_helper'

feature 'User authentication' do
  context 'Signed in' do
    background do
      user = create(:user)
      visit '/'
      expect(page).not_to have_content('New Post')

      click_link 'Sign In'
      sign_in(user)
    end

    scenario 'can log in from the index' do
      expect(page).to have_content('Signed in successfully.')
      expect(page).not_to have_content('Sign Up')
      expect(page).to have_content('Sign Out')
    end

    scenario 'can log out once logged in' do
      click_link 'Sign Out'
      visit '/'
      click_link 'Sign In'
      fill_in 'Email', with: 'monkey@jungle.com'
      fill_in 'Password', with: '12345678'
      click_button 'Log in'

      click_link 'Sign Out'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end

  context 'signed out' do
    scenario 'cannot view index posts without logging in' do
      visit '/'
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

    scenario 'cannot create a new post without logging in' do
      visit new_post_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end
  end
end
