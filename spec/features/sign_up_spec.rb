require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'sign up button directs to /users/sign_up' do
    visit '/'
    click_link('Sign Up')
    expect(page).to have_content('Sign up')
    expect(current_path).to eq('/users/sign_up')
  end
  scenario 'sign up form registers user' do
    visit '/users/sign_up'
    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
    sign_up
    expect(page).to have_content('Hi, Test Johnson!')
  end
  scenario 'users cannot sign up with invalid credentials' do
    visit '/users/sign_up'
    fill_in 'user[name]', with: 'Big Suze'
    fill_in 'user[password]', with: 'Mental Posho'
    click_button 'Sign up'
    expect(page).to have_content "Email can't be blank"
    expect(page).to_not have_content 'Hello Big Suze'
  end
end