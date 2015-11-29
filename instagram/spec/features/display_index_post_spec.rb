require 'rails_helper'

feature 'post index' do
  scenario 'the index displays all posts and captions' do
    post_one = create(:post, caption: "First post")
    post_two = create(:post, caption: "Second post")

    visit '/'
    expect(page).to have_content("First post")
    expect(page).to have_content("Second post")
    expect(page).to have_css("img[src*='test_post']")
  end
end
