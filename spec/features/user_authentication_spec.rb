require 'rails_helper'

RSpec.feature 'Authentication:' do
  scenario 'can sign-up for an account' do
    visit '/users/sign_up'

    fill_in 'user_email', with: 'user@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'Sign up'

    expect(page).to have_content 'Welcome to Tech O G'
  end
end
