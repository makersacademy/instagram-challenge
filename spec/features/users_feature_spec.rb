require 'rails_helper'

feature 'Users:' do

  context 'Users not signed in on the homepage' do
    scenario 'users can see a sign_up and sign_in link' do
      visit root_path
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    scenario 'users cannot see a sign_out link' do
      visit root_path
      expect(page).not_to have_link 'Sign out'
    end
  end
end
