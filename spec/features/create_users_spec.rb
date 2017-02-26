require 'rails_helper'

feature 'Creating a new user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'via Register link in header' do
    fill_in 'User name', with: 'johndoe'
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'and username is compulsory.' do
    fill_in 'Email', with: 'johndoe@internet.com'
    fill_in 'Password', with: 'testtest', match: :first
    fill_in 'Password confirmation', with: 'testtest'
    click_button 'Sign up'
    expect(page).to have_content('can\'t be blank')
  end
end
