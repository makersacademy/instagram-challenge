require "rails_helper"

RSpec.feature "Widget management", :type => :feature do
  scenario "User creates a new widget" do
    visit "/"

    click_button "Create Widget"

    expect(page).to have_text("Widget was successfully created.")
  end
end