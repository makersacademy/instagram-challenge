RSpec.feature "Comments", type: :feature do
  scenario "Can submit comments on a post" do
    sign_up
    create_new_post
    click_link "Comment"
    fill_in "Text", with: "This post sucks"
    click_button "Create"
    expect(page).to have_content("This post sucks")
  end

  scenario "Errors are displayed when a comment does not validate" do
    sign_up
    create_new_post
    click_link "Comment"
    click_button "Create"
    expect(page).to have_content("2 errors prevented this comment from being saved")
    expect(page).to have_content("Text can't be blank\nText is too short (minimum is 2 characters)")
  end
end
