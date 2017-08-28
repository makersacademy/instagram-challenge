require 'rails_helper.rb'

feature 'Creating user' do
  scenario 'User can sign up' do
    visit('/users/sign_up')
    within(:css, 'form.new_user') do
      fill_in 'user_username', with: 'Username'
      fill_in 'user_email', with: 'user@gmail.com'
      fill_in 'user_password', with: '123456abc.'
      fill_in 'user_password_confirmation', with: '123456abc.'
      click_button 'Sign up'
    end
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end
end
