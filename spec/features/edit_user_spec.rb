require 'rails_helper'
RSpec.feature 'users can edit their details' do
  scenario 'there is an edit users button' do
    sign_up
    expect(page).to have_link 'Edit Profile'
  end
  scenario 'takes us to a new form' do
    sign_up
    click_link 'Edit Profile'
    expect(page).to have_field('user[name]')
    expect(page).to have_field('user[email]')
    expect(page).to have_field('user[password]')
  end
  scenario 'editing the user edits the user' do
    sign_up
    click_link 'Edit Profile'
    fill_in 'user[name]', with: 'Edit Johnson'
    fill_in 'user[email]', with: 'Editjohnson@testmail.com'
    fill_in 'user[current_password]', with: '123456'
    fill_in 'user[password]', with: '123456'
    click_button 'Update'
    expect(page).to have_content 'Hi, Edit Johnson!'
  end
  
  scenario 'users can delete their account' do
    sign_up
    click_link 'Edit Profile' 
    click_button 'Cancel my account'
    click_link 'Log In'
    fill_in 'user[email]', with: 'testjohnson@testmail.com'
    fill_in 'user[password]', with: '123456'
    click_button 'Log in'
    expect(page).to_not have_content 'Hi, Test Johnson!'
  end
end
