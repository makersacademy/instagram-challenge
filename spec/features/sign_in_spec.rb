require 'rails_helper'
require 'create_user_and_sign_up'

RSpec.feature "Sign in", type: :feature do
  scenario "User can click link through to sign in page" do
    visit "/"
    expect(page).to have_link("Sign in")
  end
end
