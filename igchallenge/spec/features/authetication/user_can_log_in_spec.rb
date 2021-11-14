require 'rails_helper'

feature 'logging in' do
  scenario 'user can successfully log in' do
    sign_up
    sign_out
    visit '/'
    click_link 'Login'
    fill_in 'email', with: "test@test.com"
    fill_in 'password', with: "test"
    click_button "Log In"

    expect(page).to have_content 'Welcome, Mr.Test'
  end

  scenario 'user fails to log in' do
    sign_up
    sign_out
    visit '/'
    click_link 'Login'
    click_button "Log In"

    expect(page).not_to have_content 'Welcome, Mr.Test'
  end
end