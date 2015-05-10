require 'rails_helper'

feature 'Likes' do
  before do
    post = Post.create(name: 'a post', content: 'its a post')
  end

  scenario 'liking a post increase its like count', js: true do
    visit '/'
    click_link 'like'
    expect(page).to have_content '1 likes'
  end
end
