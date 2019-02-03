require 'rails_helper.rb'
require 'web_helpers'

feature 'User autherntication' do
  scenario 'a user can use sign up to create an account' do
    visit '/'
    click_link 'Sign up'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'an existing user can use sign in to their account' do
    sign_up_steps
    click_link 'Sign out'
    click_link 'Sign in'
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'test123'
    click_button'Log in'
    expect(page).to have_content 'Currently logged in as test@test.com'
  end
end
