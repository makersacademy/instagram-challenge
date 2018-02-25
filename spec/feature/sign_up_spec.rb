require 'rails_helper'

feature 'User Sign-up' do
  scenario 'user can sign up' do
    sign_up("user@test.com", "password", "password")
    expect(page).to have_current_path('/')
    expect(page).to have_content('Welcome! You have signed up successfully')
  end
end
