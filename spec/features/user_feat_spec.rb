require 'rails_helper'

feature 'User' do
  context 'can sign up on the main page' do
    scenario 'can sign up filling a form' do
      sign_up
      expect(page).to have_button('Log out')
      expect(page).not_to have_button('Sign up')
      expect(page).not_to have_button('Log in')
    end

    scenario 'can log out' do
      sign_up
      expect(current_path).to eq '/'
      click_button('Log out')
      expect(page).to have_button('Join Instapic!')
      expect(page).to have_button('Log in')
    end
  end

  context 'sign up with a nickname' do
    scenario 'cannot sign up without nickname' do
      visit '/'
      click_button 'Join Instapic!'
      fill_in 'user_nickname', with: ''
      fill_in 'user_email', with: 'jenny@makers.com'
      fill_in 'user_password', with: '123456'
      fill_in 'user_password_confirmation', with: '123456'
      click_button('Sign up')
      expect(page).to have_content 'error'
    end
  end

  context 'like pictures' do
    xscenario 'cannot like a pic more than once', js: true do
      sign_up
      share_instapic
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content '1 like'
    end
  end
end
