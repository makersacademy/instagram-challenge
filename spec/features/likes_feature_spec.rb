require "rails_helper"

feature "likes" do

  before do
    sign_up
    add_image("Selfie")
    click_button "Upload image"
  end

  scenario "image starts out with no likes" do
    expect(page).to have_content "Like: 0"
    click_link "Selfie"
    expect(page).to have_content "Like: 0"
  end

  scenario "liking an image increases counter by 1" do
    click_link "Selfie"
    click_link "Like"
    expect(page).to have_content "Like: 1"
    visit "/"
    expect(page).to have_content "Like: 1"

  end
end
