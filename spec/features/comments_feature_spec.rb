require "rails_helper"

feature "comments" do

  before do
    sign_up
    add_image("Selfie")
    click_button "Upload image"
    click_link "Sign out"
    sign_up("commenter@mail.com")
  end

  scenario "add a comment to an image" do
    add_comment("Lovely picture")
    expect(page).to have_content "Lovely picture"
  end

  scenario "comments can be seen on index" do
    add_comment("Lovely picture")
    visit "/"
    expect(page).to have_content "Lovely picture"
  end

  scenario "comment cannot be empty" do
    add_comment("")
    expect(page).to have_content "error"
  end

  scenario "users can see who wrote a comment" do
    add_comment("Lovely picture")
    expect(page).to have_content "commenter@mail.com"
    visit "/"
    expect(page).to have_content "commenter@mail.com"
  end

end
