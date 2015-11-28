require 'rails_helper'

feature 'users' do
  scenario 'contains all relevant information to be able to sign up or sign in' do
    visit '/uploads'
    expect(page).to have_button('Sign in')
    expect(page).to have_button('Sign up')
  end
end