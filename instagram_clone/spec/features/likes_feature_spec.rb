require 'rails_helper'

feature 'Likes' do
  before do
    post = Post.create(name: 'a post', content: 'its a post')
    comment = post.comments.create(thoughts: 'its ok')
  end

  xscenario 'liking a comment increase its like count' do
    visit '/'
    click_link 'a post'
    click_link 'like comment'
    expect(page).to have_content 'likes: 1'
  end
end

# link like comment