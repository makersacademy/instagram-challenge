require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'user signs up through users/new form and sees their username' do
    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
  end

  scenario 'user signs up through users/new form, tries existing username, and sees error' do
    User.create(username: 'davedude', email: 'davedude@example.com', password: 'password123', name: 'Dave Dude')

    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'differentemail@example.com'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'This username or email already in use'
  end

  scenario 'user signs up through users/new form, tries existing email, and sees error' do
    User.create(username: 'davedude', email: 'davedude@example.com', password: 'password123', name: 'Dave Dude')

    visit 'users/new'
    fill_in 'user[name]', with: 'Dave Dude'
    fill_in 'user[email]', with: 'davedude@example.com'
    fill_in 'user[username]', with: 'differentusername'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'This username or email already in use'
  end

end