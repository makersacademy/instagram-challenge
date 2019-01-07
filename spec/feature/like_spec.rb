require "helpers/authentication_helper"
require "helpers/post_helper"

feature "Likes" do
  scenario "Likes a post" do
    sign_up_as_user_a
    upload_cat_picture
    expect(page).to have_content("Likes (0)")
    click_link "Like"
    expect(page).to have_content("Likes (1)")
  end

  scenario "Removes a like" do
    sign_up_as_user_a
    upload_cat_picture
    expect(page).to have_content("Likes (0)")
    click_link "Like"
    expect(page).to have_content("Likes (1)")
    click_link "Unlike"
    expect(page).to have_content("Likes (0)")
  end
end
