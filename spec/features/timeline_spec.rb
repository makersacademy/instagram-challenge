# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Asks not signed in user to sign in or sign up if timeline is empty" do
    visit "/"
    expect(page).to have_content "Oh no! There are currently no photos!"
    expect(page).to have_link "Sign In"
    expect(page).to have_link "Sign Up"
  end

  scenario "Asks signed in user to post photo if timeline is empty" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(page).to have_content "Oh no! There are currently no photos!"
    expect(page).to have_link "New Post"
  end
end
