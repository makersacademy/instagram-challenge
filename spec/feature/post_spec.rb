require "helpers/authentication_helper"
require "helpers/post_helper"

feature "Posts" do
  scenario "Navigate to Post an Image" do
    sign_up_as_user_a
    click_link "New post"
    expect(page).to have_content("Post an image")
  end
  scenario "Posts an Image" do
    sign_up_as_user_a
    click_link "New post"
    attach_file("Image", Rails.root + "spec/fixtures/files/Cat.jpg")
    fill_in "Description", with: "Cats are great!"
    click_button "Upload"
    expect(page).to have_content("Cats are great!")
  end
  scenario "Deletes own post" do
    sign_up_as_user_a
    click_link "New post"
    attach_file("Image", Rails.root + "spec/fixtures/files/Cat.jpg")
    fill_in "Description", with: "Cats are great!"
    click_button "Upload"
    click_link "Delete"
    expect(page).not_to have_content "Cats are great!"
  end
end
