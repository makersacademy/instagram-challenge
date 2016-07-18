require 'rails_helper'

feature 'Creating a new user' do
  before do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user via the index page' do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'requires a username to successfully create an account' do
    fill_in 'Email', with: 'thisisfun@hotmail.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("can't be blank")
 end

 scenario 'requires a username to be more than 4 characters' do
   fill_in 'User name', with: 'h'
   fill_in 'Email', with: 'thisisfun@hotmail.com'
   fill_in 'Password', with: 'supersecret', match: :first
   fill_in 'Password confirmation', with: 'supersecret'

   click_button 'Sign up'
   expect(page).to have_content('minimum is 4 characters')
 end

 scenario 'requires a username to be less than 16 characters' do
    fill_in 'User name', with: 'h' * 17
    fill_in 'Email', with: 'thisisfun@hotmail.com'
    fill_in 'Password', with: 'supersecret', match: :first
    fill_in 'Password confirmation', with: 'supersecret'

    click_button 'Sign up'
    expect(page).to have_content("maximum is 16 characters")
  end
end
