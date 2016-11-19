require 'rails_helper'

feature 'liking posts' do
  before do
    Post.create(caption: 'sunset')
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/'
    click_link 'Like post'
    expect(page).to have_content('1 like')
  end

end
