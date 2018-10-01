require 'rails_helper'

RSpec.feature "Post a picture", type: :feature do
  scenario "User can sign up" do
    visit "/users/sign_up"
    fill_in "user_username", with: "MyName"
    fill_in "user_email", with: "ab@cd.com"
    fill_in "user_password", with: "123456"
    fill_in "user_password_confirmation", with: "123456"
    click_button "Sign up"

    click_link "Post Picture"
    fill_in "post[message]", with: "test caption"
    attach_file("post[image]", Rails.root + "spec/features/helpers/eagletophat.jpg")
    click_button "Submit"

    expect(page).to have_content("test caption")
  end
end
