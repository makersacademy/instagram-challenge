require 'rails_helper'

feature "Timeline", type: :feature do
  scenario "Can submit pic and view them" do
    visit "/pics"
    click_link "New post"
    fill_in "title", with: "Hello, world!"
    fill_in "description", with: "Hello to the whole world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
