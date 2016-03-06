require 'rails_helper'

feature 'liking posts' do
  before do
    post1 = Post.create(message: 'Hello world')
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/restaurants'
    click_link 'Like Post' #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 like')
  end

end
