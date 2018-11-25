require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end
  scenario 'can create a new user via the index page' do
    fill_in 'User name', with: 'chloeverity'
    fill_in 'Email', with: 'chloeverity@myspace.com'
    fill_in 'Password', with: 'lolmyspace', match: :first
    fill_in 'Password confirmation', with: 'lolmyspace'

    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a user name to successfully create an account' do
    fill_in 'Email', with: 'chloeverity@myspace.com'
    fill_in 'Password', with: 'lolmyspace', match: :first
    fill_in 'Password confirmation', with: 'lolmyspace'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
  end

  scenario 'requires a user name to be more than 4 characters' do
    fill_in 'User name', with: 'c'
    fill_in 'Email', with: 'chloeverity@myspace.com'
    fill_in 'Password', with: 'lolmyspace', match: :first
    fill_in 'Password confirmation', with: 'lolmyspace'

    click_button 'Sign up'
    expect(page).to have_content("minimum is 4 characters")
  end
end
