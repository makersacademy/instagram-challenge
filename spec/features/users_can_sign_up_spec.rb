require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  scenario 'user signs up through form and see their username' do
    visit 'users/new'
    fill_in 'user[:name]', with: 'Dave Dude'
    fill_in 'user[:email]', with: 'davedude@example.com'
    fill_in 'user[:username]', with: 'davedude'
    fill_in 'user[:password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
  end
end