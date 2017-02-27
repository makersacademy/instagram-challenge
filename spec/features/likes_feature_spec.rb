require 'rails_helper'

feature 'liking posts' do
  # before do
  #   @user = User.create(email: 'ben@ben.com', password: 'ben123')
  #   @posts = Post.create(description: 'Holiday', user: @user)
  #   sign_in
  # end

  it 'a user can like a post, which updates the like count', js: true do
    @user = User.create(email: 'ben@ben.com', password: 'ben123')
    @posts = Post.create(description: 'Holiday', user: @user)
    visit '/posts'
    click_link "Like #{@posts.description}"
    expect(page).to have_content('1 likes')
  end
end
