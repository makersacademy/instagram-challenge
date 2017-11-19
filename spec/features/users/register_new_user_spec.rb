require 'rails_helper'

feature 'Registering user' do
  background do
    visit '/'
    click_link 'Register'
  end

  scenario 'can register new user' do
    fill_in 'user_user_name', with: 'testuser_1'
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  it 'needs an username to register' do
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("User name can't be blank")
  end

  it 'needs a unique username to register' do
    create_user
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_user_name', with: 'testuser_1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("User name has already been taken")
  end

  it 'needs an email to register' do
    fill_in 'user_user_name', with: 'testuser_1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
  end

  it 'needs a unique email to register' do
    create_user
    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_user_name', with: 'testuse_1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content("Email has already been taken")
  end

  it 'passwords must match to register' do
    fill_in 'user_email', with: 'test_user_1@test.com'
    fill_in 'user_user_name', with: 'testuser_1'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'passwor'
    click_button 'Sign up'
    expect(page).to have_content("Password confirmation doesn't match")
  end
end
