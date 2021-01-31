require 'rails_helper'

RSpec.feature "Edit post", type: :feature do
  scenario "user can edit own post" do
    log_in
    post_picture
    expect(first('.each-post')).to have_link "Edit"
    click_link "Edit"
    pending 'waiting'
  end

  scenario "user cannot edit someone else's picture" do
    user = User.create(username: "TestUser2", email: "Test2@example.com", password: "password")
    post = user.posts.create(caption: "Testing")
    log_in
    expect(first('.each-post')).not_to have_link "Edit"
  end
end
