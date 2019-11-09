require 'rails_helper'

RSpec.feature 'Home Page' do
  scenario 'shows the sign up form' do
    visit '/'
    expect(page).to have_content('Kevstagram')
    expect(page).to have_field('email')
    expect(page).to have_field('password')
    expect(page).to have_field('password_confirmation')
    expect(page).to have_button('Sign Up')
    expect(page).to have_link('Log In')
  end
end