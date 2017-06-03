require 'rails_helper'

RSpec.feature "Routing", type: :feature do
  scenario "Can only visit wall when signed in" do
    visit "/"
    expect(page).not_to have_content('New post')
  end

  scenario "Root visits wall when signed in" do
    sign_up
    expect(page).to have_content('New post')
  end

  scenario "Root displays sign-up view when not signed in" do
    visit "/posts"
    expect(page).not_to have_content('New post')
  end
end
