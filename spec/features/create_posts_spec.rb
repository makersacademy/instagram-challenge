require 'rails_helper'

RSpec.feature "Creating posts", type: :feature do
  scenario "posts are displayed in reverse order with title and timestamp" do
    create_new_post
    create_new_post(title: "This is the second post")
    create_new_post(title: "This is the most recent post")
    expect(page.find('.posts-index-posts li:first-child')).to have_content("This is the most recent post")
    expect(page.find('.posts-index-posts li:first-child')).to have_content(Post.last.created_at.localtime.strftime('%d-%b-%Y %I:%M:%S %p'))
  end
end

def create_new_post(title: "Hello, world")
  visit "/posts"
  click_link "New post"
  fill_in "Title", with: title
  click_button "Submit"
end
