require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Visitor signs up" do
  scenario "by navigating to the page" do
    visit sign_in_path

    click_link I18n.t("sessions.form.sign_up")

    expect(current_path).to eq sign_up_path
  end

  scenario "with valid email and password" do
    sign_up_with "valid@example.com", "password", "username"
    expect_user_to_be_signed_in
  end

  scenario "tries with invalid email" do
    sign_up_with "invalid_email", "password", "username"

    expect_user_to_be_signed_out
  end

  scenario "tries with blank password" do
    sign_up_with "valid@example.com", "", "username"

    expect_user_to_be_signed_out
  end

  scenario "tries with blank username" do
    sign_up_with "valid@example.com", "password", ""

    expect_user_to_be_signed_out
  end

  scenario "tries with invalid username(too short)" do
    sign_up_with "valid@example.com", "password", "abc"

    expect_user_to_be_signed_out
  end

  scenario "tries with invalid username(too long)" do
    sign_up_with "valid@example.com", "password", "abcdefghijklmnopqrstu"

    expect_user_to_be_signed_out
  end
end
