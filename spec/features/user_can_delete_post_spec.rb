require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  scenario "user can delete own post" do
    log_in
    post_picture
    expect(first('.each-post')).to have_link "Delete"
    click_link "Delete"
    expect(page).to_not have_selector('.each-post')
  end

  scenario "user cannot delete someone else's picture" do
    # Create a post owned by a different user
    second_user = User.create(username: "TestUser2", email: "Test2@example.com", password: "password")
    second_users_post = user.posts.create(caption: "Testing")
    # Log in as the first user
    log_in
    # First user should not see second user's post
    expect(first('.each-post')).not_to have_link "Delete"
  end
end
