require 'rails_helper'

RSpec.feature 'Homepage' do
  scenario 'user can log if signed up' do
    log_in_test_user
    expect(page).to have_content('Welcome to InstagramAPP!')
  end

  scenario 'user can log out' do
    log_in_test_user
    click_link('Logout')
    expect(page).to_not have_content('Welcome to InstagramAPP!')
  end

  # scenario 'user cannot log in if not signed up' do
  #   visit '/'
  #   fill_in ('user_email'), with: 'test2@test2.com'
  #   fill_in ('user_password'), with: '123456'
  #   click_button ('Log in')
  #   expect(current_path).to eq ('/users/sign_up')
  # end
end
