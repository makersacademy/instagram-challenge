require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  scenario "Can only view photo timeline when signed in" do
    visit "/"
    expect(page).not_to have_content('Photo timeline')
  end

  scenario "Root visits wall when signed in" do
    sign_in
    visit "/"
    expect(page).to have_content('Photo timeline')
  end

  scenario "Root displays sign-up view when not signed in" do
    visit "/photos"
    expect(page).to have_content('Sign up')
  end
end
