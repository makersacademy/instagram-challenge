require 'rails_helper'

feature 'User signup' do
  background do
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'user123'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'Username', with: 'A'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end
end
