require 'rails_helper'

feature 'liking a post' do
  before do
    yum = Post.create(comment: 'yum')
    yum.comments.create(comment: 'that looks great')
  end

  scenario 'a user can like a post, which updates the post like count' do
    visit '/posts'
    click_link 'Like Post'
    expect(page).to have_content('1 like')
  end

end
