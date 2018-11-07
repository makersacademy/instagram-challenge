require 'rails_helper'

RSpec.feature "Sign In", type: :feature do
  scenario "User can sign in" do
    user_sign_up
    click_link "Sign out"

    user_sign_in

    expect(page).to have_content("Signed in successfully")
  end
end
