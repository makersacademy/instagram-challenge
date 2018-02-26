require 'rails_helper'

feature 'User Log-in' do
  scenario 'user can log in' do
    sign_up("tester@test.com", "password", "password")
    click_link 'Log out'
    log_in("tester@test.com", "password")
    expect(page).to have_current_path('/')
    expect(page).to have_content('Signed in successfully')
  end
end
