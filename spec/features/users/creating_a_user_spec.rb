require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    fill_in 'Username', with: 'jonbonjovi'
    fill_in 'Email', with: 'jonbonjovi@gmail.com'
    fill_in 'Password', with: 'itsMyLife99', match: :first
    fill_in 'Password confirmation', with: 'itsMyLife99'

    click_button 'Sign up'
    expect(page).to have_content('Welcome to Trollstagram! You have signed up successfully.')
  end

  scenario 'requires a username to create an account' do
    fill_in 'Email', with: 'jonbonjovi@gmail.com'
    fill_in 'Password', with: 'itsMyLife99', match: :first
    fill_in 'Password confirmation', with: 'itsMyLife99'

    click_button 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("You need a username to start trolling.")
  end
end
