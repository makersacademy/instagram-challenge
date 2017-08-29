RSpec.feature "Likes", type: :feature do
  scenario "Can like a post" do
    sign_up
    create_new_post
    click_link "Like"
    expect(page.find('.posts-index li:first-child .posts-index-post-likes')).to have_content("1")
  end
end
