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
    expect(page).to have_content("can't be blank.")
  end

  scenario 'requires a username to be longer than 4 characters' do
    fill_in 'Username', with: 'jon'
    fill_in 'Email', with: 'jonbonjovi@gmail.com'
    fill_in 'Password', with: 'itsMyLife99', match: :first
    fill_in 'Password confirmation', with: 'itsMyLife99'

    click_button 'Sign up'
    expect(page).to have_content('minimum is 4 characters')
  end

  scenario 'requires a username to be shorter than 20 characters' do
    fill_in 'Username', with: 'jon' * 7
    fill_in 'Email', with: 'jonbonjovi@gmail.com'
    fill_in 'Password', with: 'itsMyLife99', match: :first
    fill_in 'Password confirmation', with: 'itsMyLife99'

    click_button 'Sign up'
    expect(page).to have_content('maximum is 20 characters')
  end
end
