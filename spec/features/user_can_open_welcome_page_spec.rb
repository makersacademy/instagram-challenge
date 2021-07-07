require 'rails_helper'

RSpec.feature "Welcome page", type: :feature do
  scenario "Can view welcome page" do

    visit "/"
    expect(page).to have_content("Welcome")
  end
end
