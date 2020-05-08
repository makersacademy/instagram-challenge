require 'rails_helper'

RSpec.feature 'Log In', type: :feature do
  scenario 'user logs in through sessions/new form, correct password, and sees their username' do
    User.create(username: 'davedude', email: 'davedude@example.com', password: 'password123', name: 'Dave Dude')
    visit 'sessions/new'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
  end

  scenario 'user logs in through sessions/new form, WRONG password, and sees error' do
    User.create(username: 'davedude', email: 'davedude@example.com', password: 'password123', name: 'Dave Dude')
    visit 'sessions/new'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'wrongpassword'
    click_on 'Submit'
    expect(page).to have_content 'Incorrect username or password'
  end
end