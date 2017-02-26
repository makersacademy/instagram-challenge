require 'rails_helper'

feature 'user can sign in and out' do
  context 'user is not signed in' do
    scenario 'user can sign in' do
      visit '/'
      expect(page).not_to have_link 'Sign out'
      click_link 'Sign in'
      expect(page.current_path).to eq '/users/sign_in'
    end
  end

  context 'user is signed in' do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'bob@example.com'
      fill_in 'Password', with: 'testtest'
      fill_in 'Password confirmation', with: 'testtest'
      click_button 'Sign up'
    end

    scenario 'user should see a sign out link' do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    scenario 'user should not see a sign in link' do
      visit '/'
      expect(page).to_not have_link 'Sign in'
    end
  end
end
