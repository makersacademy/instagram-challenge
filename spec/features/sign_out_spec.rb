require 'rails_helper'
RSpec.feature 'users can log in and out ' do
  scenario 'signed up user can log out' do
    sign_up
    click_link('Log Out')
    expect(page).to have_content('Log In')
  end
  scenario 'log in form on log in' do
    sign_up
    click_link 'Log Out'
    click_link 'Log In' 
    fill_in 'user[email]', with: 'testjohnson@testmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    
    expect(page).to have_content 'Hi, Test Johnson!'
  end
  scenario 'when email not correct' do
    sign_up
    click_link('Log Out')
    click_link('Log In')
    fill_in 'user[email]', with: 'wrongjohnson@testmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
   
    expect(page).to have_content('Invalid email or password')
  end
  scenario 'cannot sign up with already used email' do
    sign_up
    click_link('Log Out')
    sign_up
    expect(page).to have_content('Email has already been taken')
  end
end
