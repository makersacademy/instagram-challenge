require 'rails_helper'

RSpec.feature "Likes", type: :feature do
  scenario "Can like a post" do
    sign_up
    create_new_post
    click_button "Like"
    expect(page.find('.posts-index-posts li:first-child .posts-index-post-likes')).to have_content("1")
  end
end
