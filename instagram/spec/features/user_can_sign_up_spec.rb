require 'rails_helper'

RSpec.feature "Signup", type: :feature do
  scenario "A user must be able to sign up" do
    visit('/signup')
    fill_in(:user_email, with: "testing@demo.com")
    fill_in(:user_name, with: "test")
    fill_in(:user_username, with: "testsongzz")
    fill_in(:user_password, with: "test123456")
    click_button('Next')
    expect(page).to have_content('testsongzz')
  end
end
