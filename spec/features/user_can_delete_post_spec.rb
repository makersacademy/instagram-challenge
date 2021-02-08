require 'rails_helper'

RSpec.feature "Delete post", type: :feature do
  scenario "user can delete own post" do
    log_in
    # This stops in the next method due to ActiveSupport::MessageVerifier::InvalidSignature error again. Help!
    post_no_picture
    expect(first('.each-post')).to have_link "Delete"
    click_link "Delete"
    expect(page).to_not have_selector('.each-post')
  end

  scenario "user cannot delete someone else's picture" do
    secondUser = User.create(username: "TestUser2", email: "Test2@example.com", password: "password")
    p "user is #{secondUser}"
    post = secondUser.posts.create(caption: "Testing")
    p "post is #{post}"
    # log in as first user (username TestUser)
    log_in
    # Test fails here but I'm struggling to find out why.
    expect(page).to have_content ("Testing")
    expect(first('.each-post')).not_to have_link "Delete"
  end
end
