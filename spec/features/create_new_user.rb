require 'rails_helper'

feature 'Create a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user' do
    fill_in 'User name', with: 'Laurent'
    fill_in 'Email', with: 'laurent@makers.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario 'rusername is needed to create an account' do
    fill_in 'Email', with: 'laurent@makers.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

  click_button 'Sign up'
  expect(page).to have_content("can't be blank")
end
end
