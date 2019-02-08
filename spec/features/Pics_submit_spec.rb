require 'rails_helper'
require_relative 'web_helper'

feature "Pic", type: :feature do
  scenario "Can submit pic and view them by reversed chronological order" do
    visit "/pics"
    click_link "POST NEW PIC"
    fill_in "Title", with: "Hello, world!"
    fill_in "Description", with: "Hello to the whole world!"
    click_button "Submit"
    expect(page).to have_content("Hello, world!")
  end

  scenario "Can edit a pic" do
    visit "/pics/1"
    click_link "Edit Pic"
    fill_in "Title", with: "Hi!"
    fill_in "Description", with: "How is everyone ?"
    click_button "Submit"
    expect(page).to have_content("Hi!")
  end

  scenario "Can cancel an edition of a pic" do
    visit "/pics/1"
    click_link "Edit Pic"
    click_link "Cancel edition"
    expect(page).to have_current_path("/")
  end

  scenario "Can delete a pic" do
    pic2
    visit "/pics/2"
    click_link "Delete Pic"
    expect(page).to have_current_path("/")
  end

end
