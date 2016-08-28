require "rails_helper"

feature "comments" do

  before do
    Post.create(caption: "Selfie")
  end

  scenario "add a comment to an image" do
    visit "/"
    click_link "Selfie"
    click_link "Add comment"
    fill_in "Comment", with: "Lovely picture"
    click_button "Add comment"
    expect(page).to have_content "Lovely picture"
  end

  scenario "comment cannot be empty" do
    visit "/"
    click_link "Selfie"
    click_link "Add comment"
    fill_in "Comment", with: ""
    click_button "Add comment"
    expect(page).to have_content "error"
  end

  scenario "comment can be seen on individual images" do
    visit "/"
    click_link "Selfie"
    click_link "Add comment"
    fill_in "Comment", with: "Lovely picture"
    click_button "Add comment"
    click_link "Selfie"
    expect(page).to have_content "Lovely picture"
  end

end
