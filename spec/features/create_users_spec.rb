require 'rails_helper'

feature 'Creating a new user' do  
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user' do
    click_link 'Register'
    fill_in 'User name', with: 'Alessandro'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end
  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User name', with: 'h'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end
  scenario 'but less than 16' do
    fill_in 'User name', with: 'h' * 17
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password', match: :first
    fill_in 'Password confirmation', with: 'password'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end
end  
