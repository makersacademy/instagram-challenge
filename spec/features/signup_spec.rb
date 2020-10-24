require 'rails_helper'

RSpec.feature "User Registration", :type => :feature do
  scenario 'An error occurs if the password confirmation fails' do
    visit '/users/sign_up'
    fill_in "Username", with: "Joe Bloggs"
    fill_in "Email", with: "joeb@hotmail.com"
    fill_in "Password", with: "secret"
    click_button "Sign Up"
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario 'An error occurs if the email is not present' do
    visit '/users/sign_up'
    fill_in "Username", with: "Joe Bloggs"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign Up"
    expect(page).to have_content "Email can't be blank"
  end

  scenario 'An error occurs if the username is not present' do
    visit '/users/sign_up'
    fill_in "Email", with: "joeb@hotmail.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign Up"
    expect(page).to have_content "Username can't be blank"
  end
  
  scenario 'An error occurs if the username is not present' do
    visit '/users/sign_up'
    fill_in "Username", with: "Joe Bloggs"
    fill_in "Email", with: "joeb@hotmail.com"
    fill_in "Password", with: "secret"
    fill_in "Password confirmation", with: "secret"
    click_button "Sign Up"
    expect(page).to have_content "Email can't be blank"
  end

end
