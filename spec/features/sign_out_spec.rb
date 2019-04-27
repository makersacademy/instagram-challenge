require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Sign in", type: :feature do
  scenario "User can see sign out button" do
    create_user_and_sign_up
    expect(page).to have_button('Sign out')
  end

  scenario "User sees success message when signed out" do
    create_user_and_sign_up
    click_button('Sign out')
    expect(page).to have_content('See you soon!')
  end
end
