require 'rails_helper'

RSpec.feature "Account Creation", type: :feature do
  scenario "User can see a form for account creation" do
    visit "/users/new"
    expect(page).to have_field('user_name')
    expect(page).to have_field('user_email')
    expect(page).to have_field('user_password')
  end

  scenario "User can supply a name, email and password to create an account" do
    visit "/posts"
    click_link('Sign Up')
    fill_in 'user_name', with: 'Jade'
    fill_in 'user_email', with: 'jade@jade.com'
    fill_in 'user_password', with: '123456'
    fill_in 'user_password_confirmation', with: '123456'
    click_button 'Submit'
    expect(page).to have_content("Hello Jade")
  end

end
