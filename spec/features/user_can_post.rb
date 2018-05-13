require 'rails_helper'


RSpec.feature "Post photo", type: :feature do
  def user_sign_up
    visit "/users/sign_up"
    fill_in "user_email", with: "jordan@matt.com"
    fill_in "user_password", with: "123456abc"
    fill_in "user_password_confirmation", with: "123456abc"
    click_button "Sign up"
  end
  scenario "The user has an option to post a photo to the app" do
    user_sign_up
    expect(page).to have_button("Add photo")

  end
end
