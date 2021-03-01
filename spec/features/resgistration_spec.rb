require 'rails_helper'

RSpec.feature 'Registration', type: :feature do
  scenario 'Users can sign up on the sign up page' do
    sign_up
    expect(page).to have_content('Joe Bloggs')
  end

  scenario 'User can not sign up with a taken email address' do
    sign_up
    sign_out
    visit 'users/sign_up'
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'joebloggs@test.com'
    fill_in 'user[username]', with: 'johndoe'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Email has already been taken')
  end

  scenario 'User can not sign up with a taken username' do
    sign_up
    sign_out
    visit 'users/sign_up'
    fill_in 'user[first_name]', with: 'John'
    fill_in 'user[last_name]', with: 'Doe'
    fill_in 'user[email]', with: 'johndoe@test.com'
    fill_in 'user[username]', with: 'joebloggs'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Sign up'
    expect(page).to have_content('Username has already been taken')
  end
end