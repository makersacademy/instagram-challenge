require 'rails_helper'

feature "Timeline", type: :feature do
  scenario "Can submit pic and view them" do
    visit "/pics"
    click_link "Post New Pic"
    fill_in "Title", with: "Hello, world!"
    fill_in "Description", with: "Hello to the whole world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end
end
