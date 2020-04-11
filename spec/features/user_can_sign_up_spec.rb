require 'rails_helper'

RSpec.feature 'User Sign Up', type: :feature do
  scenario 'the user is redirected to the sign up page if they visit another URL before signing up' do
    visit '/'
    expect(current_path).to eq '/users/sign_up'
  end

  scenario 'the user can see prompts for email and password on sign up page' do

  end

  scenario 'the user can only enter valid email' do

  end

  scenario 'the user can only enter a password between 6-10 characters' do

  end

  scenario 'once signed in the user is redirected to the welcome page' do

  end
end
