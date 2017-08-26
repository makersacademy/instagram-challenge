require 'rails_helper'

RSpec.feature "Photos" do
  it "has a page for uploading a new photo" do
    visit "/photos/new"
    expect(page).to have_content "Upload a photo to Ynstagram"
  end

  it "allows the user to upload a photo" do
    visit "/photos/new"
    fill_in("Description", with: "Emily plays chess!")
    attach_file("Image", Rails.root + "spec/fixtures/chess.JPG")
    click_button("Upload")
    expect(page).to have_css("img[src*='chess.JPG']")
  end
end
