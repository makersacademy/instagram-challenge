require 'rails_helper'



RSpec.feature "Sign in", type: :feature do

  scenario "When uses sign in with the correct password and email they are are able to access their page"  do 
    user = User.create(name: "user", email: "user@example.com", password: "12345")
    visit "sessions/new"
    fill_in 'session[email]', with: 'user@example.com'
    fill_in  'session[password]', with: '12345'
    click_on 'Sign in'
    expect(page).to have_content('user')
  end 

  scenario "When users sign in with the wrong password they are not  able to  sign in " do 
    user = User.create(name: "user", email: "user@example.com", password: "12345")
    visit "sessions/new"
    fill_in 'session[email]', with: 'user@example.com'
    fill_in  'session[password]', with: 'wrong password'
    click_on 'Sign in'
    expect(page).to have_no_content("user")

  end 
end

# test to see where it  has been redirected 