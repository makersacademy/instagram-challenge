# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Sign Up validation errors", type: :feature do
  scenario "A user cant' sign up without a first name and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_last_name", with: user.last_name
      fill_in "user_username", with: user.username
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Sign Up"
    end
    expect(page).to have_content "can't be blank"
  end

  scenario "A user cant' sign up without a last name and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_first_name", with: user.first_name
      fill_in "user_username", with: user.username
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Sign Up"
    end
    expect(page).to have_content "can't be blank"
  end

  scenario "A user cant' sign up without a user name and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_first_name", with: user.first_name
      fill_in "user_last_name", with: user.last_name
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Sign Up"
    end
    expect(page).to have_content "can't be blank"
  end

  scenario "A user cant' sign up without an email and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_first_name", with: user.first_name
      fill_in "user_last_name", with: user.last_name
      fill_in "user_username", with: user.username
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: user.password
      click_button "Sign Up"
    end
    expect(page).to have_content "can't be blank"
  end

  scenario "A user cant' sign up without a password and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_first_name", with: user.first_name
      fill_in "user_last_name", with: user.last_name
      fill_in "user_email", with: user.email
      fill_in "user_username", with: user.username
      click_button "Sign Up"
    end
    expect(page).to have_content "is too short (minimum is 6 characters)"
  end

  scenario "A user cant' sign up without two matching password and an error is shown" do
    user = FactoryBot.create(:user)
    visit "/sign_up"
    within "#sign-up-form" do
      fill_in "user_first_name", with: user.first_name
      fill_in "user_last_name", with: user.last_name
      fill_in "user_email", with: user.email
      fill_in "user_username", with: user.username
      fill_in "user_password", with: user.password
      fill_in "user_password_confirmation", with: "blah"
      click_button "Sign Up"
    end
    expect(page).to have_content "doesn't match Password"
  end
end
