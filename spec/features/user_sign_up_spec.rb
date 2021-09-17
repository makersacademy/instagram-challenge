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

  scenario 'user can enter details to sign up' do
    visit '/'
    click_on 'Sign Up'
    fill_in 'First Name', with: 'Lizzy'
    fill_in 'Surname', with: 'Ballantine'
    fill_in 'Username', with: 'flyingBurrito'
    fill_in 'Email', with: 'cecil3@gmail.com'
    fill_in 'Password', with: 'P@ssword!'
    click_on 'Create Account'
    expect(page).to have_content('Account created')
  end
end
