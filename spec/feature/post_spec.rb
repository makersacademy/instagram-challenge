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
    upload_cat_picture
    expect(page).to have_content("Cats are great!")
  end
  scenario "Deletes own post" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Delete"
    expect(page).not_to have_content "Cats are great!"
  end
end
