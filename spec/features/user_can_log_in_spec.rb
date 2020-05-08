require 'rails_helper'

RSpec.feature 'Log In', type: :feature do
  scenario 'user logs in through sessions/new form and sees their username' do
    visit 'sessions/new'
    fill_in 'user[username]', with: 'davedude'
    fill_in 'user[password]', with: 'password123'
    click_on 'Submit'
    expect(page).to have_content 'davedude'
  end
end