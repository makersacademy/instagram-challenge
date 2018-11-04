require 'rails_helper'

RSpec.feature "Sign Up", type: :feature do
  scenario "User can sign up" do
    user_sign_up

    expect(page).to have_content("You have signed up successfully")
  end
end
