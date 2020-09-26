require 'rails_helper'

RSpec.feature "Photo", type: :feature do
  scenario "Test is working" do 
    visit("/")
    expect(page).to have_content("Photos")
  end
end