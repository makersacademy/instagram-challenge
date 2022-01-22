require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "User lands on homepage when visiting site" do
    visit "/"
    expect(page).to have_link("Log in")
    expect(page).to have_content("Don't have an account?")
  end
end