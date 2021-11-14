require 'rails_helper'

feature 'registration' do
  scenario 'a new user can register' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'user[username]', with: "Mr.Test"
    fill_in 'user[email]', with: "test@test.com"
    fill_in 'user[password]', with: "test"
    fill_in 'user[password_confirmation]', with: "test"
    click_button 'Submit'

    expect(page).to have_content 'Welcome, Mr.Test'
  end

  scenario 'failed register' do
    visit '/'
    click_link 'Sign Up'
    click_button 'Submit'
    
    expect(page).to have_content "Something went wrong. Please try again"
  end
end
