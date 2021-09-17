require 'rails_helper'

feature 'user sign up' do
  scenario 'home page has link to sign up' do
    visit '/'
    expect(page).to have_link('Sign Up')
  end

  scenario 'sign up link from homepage takes user to sign up form' do
    visit '/'
    click_on 'Sign Up'
    expect(page).to have_content('First Name')
    expect(page).to have_content('Surname')
    expect(page).to have_content('Username')
    expect(page).to have_content('Email')
    expect(page).to have_content('Password')
  end
end
