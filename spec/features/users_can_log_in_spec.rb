require 'rails_helper'

RSpec.feature "User Log In", type: :feature do
  scenario "User can see a log in form" do
    visit "/login"
    expect(page).to have_field('email')
    expect(page).to have_field('password')
  end

  scenario "User can log in with their account details" do
    new_logged_out_user
    visit "/login"
    fill_in 'email', with: 'jade@jade.com'
    fill_in 'password', with: '123456'
    click_button 'Submit'
    expect(page).to have_content("Hello Jade")
  end

  scenario "User can log out" do
    new_user
    click_link 'Log Out'
    expect(page).not_to have_content("Hello Jade")
  end

end
