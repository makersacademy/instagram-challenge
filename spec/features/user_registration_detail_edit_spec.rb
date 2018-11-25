require 'rails_helper'
require_relative '../test_helpers'

RSpec.feature 'Registration details', type: :feature do
  scenario 'User edit registration details' do
    user_sign_up
    click_link 'username123'
    expect(page).to have_current_path("/users/edit")
    fill_in "user[username]", with: "username456"
    fill_in "user[current_password]", with: "pword123"
    click_button "Update"
    expect(page).to have_content("Your account has been updated successfully.")
  end
end
