require 'rails_helper'

RSpec.feature "Homepage", type: :feature do
  scenario "Has Title" do
    visit "/"
    expect(page).to have_content("Patrick's Instagram")
  end
end
