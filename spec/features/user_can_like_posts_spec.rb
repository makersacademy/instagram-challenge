require 'rails_helper'

RSpec.feature "UserCanLikePosts", type: :feature do
  scenario 'user likes a picture' do
    Post.create(content: "content", image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'author' )
    visit '/'

    click_button("Like")

    posts = page.all(".post")
    
    expect(posts[0]).to have_content "1 likes"
  end

  scenario 'post get many likes' do
    Post.create(content: "content", image: fixture_file_upload('./spec/fixtures/test-image.jpeg'), author: 'author' )
    visit '/'

    
    click_button("Like")
    click_button("Like")
    click_button("Like")
    
    posts = page.all(".post")

    expect(posts[0]).to have_content "3 likes"
  end
end
