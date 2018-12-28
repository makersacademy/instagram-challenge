require 'rails_helper'
require_relative '../support/web_helpers_spec'

RSpec.feature "User sign out", type: :feature do
  scenario "User can sign up and then sign out" do
    user = FactoryBot.build(:user)
    sign_up(user)
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Sign Up"
    expect(page).to have_content "Hi, Joe!"
    click_link "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Hi, Joe!"
    expect(page).to have_content "Sign Up"
  end

  scenario "User can sign in and then sign out" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(page).to have_content "Hi, Joe!"
    expect(page).not_to have_content "Sign In"
    click_link "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Hi, Joe!"
    expect(page).to have_content "Sign In"
  end
end
