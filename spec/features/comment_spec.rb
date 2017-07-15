require 'rails_helper'

RSpec.feature "Comment System", type: :feature do
  scenario "User can see a field for adding a comment to a post" do
    new_user
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png", user_id: 1)
    visit "/posts"
    click_link "t h o u g h t s ?"
    expect(page).to have_field("comment_content")
  end

  scenario "User can add a comment to a post" do
    new_user
    post = Post.create(text: "Hello test!", photo: "pretend_photo.png", user_id: 1)
    visit "/posts"
    click_link "t h o u g h t s ?"
    fill_in 'comment_content', with: 'yo'
    click_button "Post comment"
    expect(page).to have_content("yo")
  end

end
