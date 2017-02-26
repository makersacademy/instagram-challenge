require 'rails_helper'

feature 'sign up' do
  context 'user is not signed in' do
    scenario 'user should be able to sign up' do
      visit '/'
      click_link 'Sign up'
      expect(page.current_path).to eq '/users/sign_up'
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

    scenario 'user should not be able to see sign up' do
      visit '/'
      expect(page).to_not have_link 'Sign up'
    end
  end
end
