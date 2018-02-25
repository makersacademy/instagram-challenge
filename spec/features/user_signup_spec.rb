require 'rails_helper'

feature 'User signup' do
  background do
    visit '/'
    click_link 'Register'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password', match: :first
    fill_in 'user_password_confirmation', with: 'password'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'user_username', with: 'user123'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name 5 characters or more' do
    fill_in 'user_username', with: 'A'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 5 characters')
  end

  scenario 'requires a user name to be 16 characters or less' do
    fill_in 'user_username', with: 'AAAAAAAAAAAAAAAAA'

    click_button 'Sign up'
    expect(page).to have_content('maximum is 16 characters')
  end
end
