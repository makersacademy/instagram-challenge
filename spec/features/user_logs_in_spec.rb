require 'rails_helper'

RSpec.feature "User sign in", type: :feature do
  scenario "User can sign in with valid credentials" do
    user = FactoryBot.create(:user)
    visit "/sign_in"
    fill_in "email", with: user.email
    fill_in "password", with: user.password
    click_button "Sign In"
    expect(current_path).to eq "/posts"
  end
end
