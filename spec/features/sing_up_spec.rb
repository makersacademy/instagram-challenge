require 'rails_helper'

RSpec.feature 'user can sign up' do
  scenario 'and reidrect to posts' do
    visit('/')
    click_link('Register')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
    expect(current_path).to eq('/images')
    expect(page).to have_content('You have signed up successfully.')
  end
end
