require 'rails_helper'

feature 'User Log-in' do
  scenario 'user can log in' do
    sign_up("user@test.com", "password", "password")
    log_in("user@test.com", "password")
    expect(page).to have_current_path('/users/sign_in')
    expect(page).to have_content('Signed in successfully')
  end
end
