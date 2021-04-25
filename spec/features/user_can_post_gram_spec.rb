require 'rails_helper'


RSpec.feature "Post a Gram", type: :feature do
  scenario "User can post a gram" do
    visit "/"
    click_link "Create a post"
    puts __FILE__
    attach_file "gram_image", "./spec/fixtures/dinosaur1.jpeg"
    fill_in "gram[body]", with: "This is my first gram."
    click_button "Submit"
    expect(page).to have_content("This is my first gram.")
    expect(page).to have_css("img[src*='dinosaur1.jpeg']")
  end

  scenario "User cannot post an empty content box, returns to new page" do
    visit "/"
    click_link "Create a post"
    click_button "Submit"
    expect(page).to have_content("Image can't be blank")
    expect(page).to have_content("Body can't be blank")
  end
end
