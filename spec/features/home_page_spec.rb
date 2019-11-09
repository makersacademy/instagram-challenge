require 'rails_helper'

RSpec.feature 'Home Page' do
  scenario 'shows the sign up form' do
    visit root_url
    puts page.html
    expect(page).to have_content('Kevstagram')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
    expect(page).to have_content('Confirm Password')
    expect(page).to have_button('Sign Up')
    expect(page).to have_link('Log In')
  end
end