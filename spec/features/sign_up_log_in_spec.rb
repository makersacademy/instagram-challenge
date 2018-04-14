require 'rails_helper'

feature "User can sign up and log in" do
  scenario "No user signed up yet, on homepage" do
    sign_up_user
    expect(page).to have_content 'Logged in as email@gmail.com'
  end
end

feature "User can log out" do
  scenario "signed in" do
    sign_up_user
    click_link 'Logout'
    expect(page).not_to have_content 'Logged in as email@gmail.com'
  end
end

feature "User can log in" do
  scenario "signed out" do
    sign_up_user
    click_link 'Logout'
    click_link 'Login'
    fill_in 'user[email]', with: "email@gmail.com"
    fill_in 'user[password]', with: "password"
    click_button 'Log in'
    expect(page).to have_content 'Logged in as email@gmail.com'
  end
end
