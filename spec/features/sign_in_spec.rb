require 'rails_helper'
include HomeHelper

RSpec.feature 'user can sign in' do
  scenario 'and gets redirected to the images' do
    sign_out
    click_link('Sign in')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    click_button('Log in')
    expect(current_path).to eq('/images')
    expect(page).to have_content('Signed in successfully.')
  end
end
