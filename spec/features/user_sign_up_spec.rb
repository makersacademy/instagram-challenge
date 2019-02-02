require 'rails_helper'
RSpec.feature "User", type: :feature do
  scenario "Can sign up" do
    visit "/users/sign_up"
    fill_in "user_email", with: "rodriguekayemebe@gmail.com"
    fill_in "user_password", with: "pASSword1"
    fill_in "user_password_confirmation", with: "pASSword1"
    click_button "Sign up"
    expect(page).to have_content("A confirmation email has been sent to the provided email address")
  end
end

