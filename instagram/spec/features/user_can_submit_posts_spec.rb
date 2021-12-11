require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  scenario "Can submit posts and view them" do
    visit "/posts"
    click_link "New Post"
    fill_in "Title", with: "This is a test post"
    click_button "Create Post"
    expect(page).to have_content("This is a test post")
  end

  scenario "Can click a post link to view individual post" do
    visit "/posts"
    click_link "New Post"
    fill_in "Title", with: "This is another test post"
    click_button "Create Post"
    click_link "This is another test post"
    expect(page).to have_content("This is another test post")
  end

  scenario "The posts are ordered from newest to oldest" do
    visit "/posts"
    click_link "New Post"
    fill_in "Title", with: "This is a post"
    click_button "Create Post"
    click_link "New Post"
    fill_in "Title", with: "This is a newer post"
    click_button "Create Post"
    expect("This is a newer post").to appear_before("This is a post")
  end

end