require 'rails_helper'
RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up" do
    visit('/')
    click_on('Register')
    fill_in('user_email', with: 'test@testing.com')
    fill_in('user_password', with: '123456')
    fill_in('user_password_confirmation', with: '123456')
    click_on('Sign up')
    expect(page).to have_content("test@testing.com")
  end
end
