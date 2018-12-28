require 'rails_helper'
require_relative '../support/web_helpers_spec'

RSpec.feature "User sign up and sign out", type: :feature do
  scenario "User can sign up and out" do
    user = FactoryBot.build(:user)
    sign_up(user)
    expect(current_path).to eq "/posts"
    expect(page).to have_content "Hi, Joe!"
    expect(page).not_to have_content "Sign In"
    expect(page).not_to have_content "Sign Up"
    click_button "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Hi, Joe!"
    expect(page).not_to have_content "Sign Out"
    expect(page).to have_content "Sign In"
    expect(page).to have_content "Sign Up"
  end
end
