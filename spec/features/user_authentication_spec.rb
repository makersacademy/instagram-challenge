require 'rails_helper'

RSpec.feature "User", type: :feature do
  let!(:user) { create(:user) }

  scenario "user can sign up" do
    sign_up
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario "When user logs out, they see the log in page" do
    sign_up
    click_link 'Log out'
    expect(current_path).to eq "/users/sign_in"
  end
end
