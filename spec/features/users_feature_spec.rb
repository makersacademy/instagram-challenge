require 'rails_helper'

feature 'User can sign in and out' do
  context 'user not signed in and on the homepage' do
    scenario 'it should see a sign in and sign up link' do
      visit '/'
      expect(page).to have_content('Sign in')
      expect(page).to have_content('Sign up')
    end

    scenario 'it should not see a Sign out link' do
      visit '/'
      expect(page).not_to have_content 'Sign out'
    end
  end

  context 'user signed up and on the homepage' do
    before do
      sign_up('Tudor', 'tudor@email.com', '123456')
    end

    scenario 'it should see a Sign out button' do
      expect(page).to have_content 'Sign out'
    end

    scenario 'it should not see a Sign in and Sign out links' do
      expect(page).not_to have_content('Sign in')
      expect(page).not_to have_content('Sign up')
    end
  end
end
