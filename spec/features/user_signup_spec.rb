require 'rails_helper'

feature 'User signup' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'user123'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
