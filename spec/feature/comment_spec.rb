require "helpers/authentication_helper"
require "helpers/post_helper"

feature "Create comment" do
  scenario "Can post comment" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Comment"
    fill_in "comment_comment", with: "great picture!"
    click_button "submit"
    expect(page).to have_content("great picture!")
  end
end
feature "Delete comment" do
  scenario "Can post comment" do
    sign_up_as_user_a
    upload_cat_picture
    click_link "Comment"
    fill_in "comment_comment", with: "great picture!"
    click_button "submit"
    expect(page).to have_content("great picture!")
    click_link "Delete"
    expect(page).to_not have_content("great picture!")
  end
end
