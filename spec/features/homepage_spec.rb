require 'rails_helper'

RSpec.feature 'Homepage' do
  scenario 'user sign up' do
    visit '/'
    within(:css, '.sign-up') do
      fill_in ('user_email'), with: 'rob@rob.com'
      fill_in ('user_password'), with: '123456'
      fill_in ('user_password_confirmation'), with: ('123456')
      click_button ('Sign up')
    end
    expect(page).to have_content('Welcome to InstagramAPP!')
  end

  scenario 'user log in' do
    User.create(email: 'rob@rob.com', password: '123456')
    visit '/'
    within(:css, '.log-in') do
      fill_in ('user_email'), with: 'rob@rob.com'
      fill_in ('user_password'), with: '123456'
      click_button ('Log in')
    end
    expect(page).to have_content('Welcome to InstagramAPP!')
  end
end
