require 'rails_helper'

RSpec.feature "UserCanLikePosts", type: :feature do
  scenario 'user likes a picture' do
    Post.create(content: "content", image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'author' )
    visit '/'

    posts = page.all(".post")

    click_button("Like")

    expect(posts[0]).to have_content "SomeONE likes this"
  end
end
