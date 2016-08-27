require 'rails_helper'

feature 'liking posts' do
  before do
    post1 = Post.create(message: 'Hello world')
  end

  it 'a user can like a post, which increments the like count', js: true do
   visit '/posts'
   click_link 'Like'
   expect(page).to have_content("1 like")
  end
end
