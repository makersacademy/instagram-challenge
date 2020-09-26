require 'rails_helper'

RSpec.feature "Photo", type: :feature do
  scenario "Create post" do 
    visit("/")
    click_link "Create Post"
    attach_file("Photo", Rails.root + "spec/fixtures/test.jpg")
    fill_in "Description", with: "Hello, world 2 !"
    click_button "Post"
    expect(page).to have_content("Your post was successfully created.")
    expect(page).to have_selector("img")
    expect(page).to have_content("Hello, world 2 !")
  end

  scenario "Post without image should raise error" do 
    visit("/")
    click_link "Create Post"
    fill_in "Description", with: "Hello, world 2 !"
    click_button "Post"
    expect(page).to have_content("Photo can't be blank")
  end

  scenario "Post without image should raise error" do 
    visit("/")
    click_link "Create Post"
    fill_in "Description", with: "Hello, world 2 !"
    attach_file("Photo", Rails.root + "spec/fixtures/test.txt")
    click_button "Post"
    expect(page).to have_content("Photo File must be GIF, JPG or PNG image.")
  end
end