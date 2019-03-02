# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User sign out", type: :feature do
  before do
    user = FactoryBot.build(:user)
    sign_up(user)
  end
  scenario "User can sign up and then sign out" do
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Sign Up"
    expect(page).to have_content "Hi, Joe!"
    click_link "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Hi, Joe!"
    expect(page).to have_content "Sign Up"
  end

  scenario "User can sign in and then sign out" do
    expect(page).to have_content "Hi, Joe!"
    expect(page).not_to have_content "Sign In"
    click_link "Sign Out"
    expect(current_path).to eq "/posts"
    expect(page).not_to have_content "Hi, Joe!"
    expect(page).to have_content "Sign In"
  end
end
