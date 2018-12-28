require 'rails_helper'

RSpec.feature "Navbar", type: :feature do
  scenario "Displays ChristaGram" do
    visit "/"
    expect(page).to have_content "ChristaGram"
  end
end
