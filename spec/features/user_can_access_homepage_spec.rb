require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User lands on homepage when visiting site" do
    visit "/"
    expect(page).to have_button("Log in")
    expect(page).to have_content("Don't have an account? Sign up")
  end
end