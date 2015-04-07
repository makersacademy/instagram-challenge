require 'rails_helper'

feature 'liking posts' do
  before do
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: 'test@example.com')
    fill_in('Password', with: 'testtest')
    fill_in('Password confirmation', with: 'testtest')
    click_button('Sign up')
    post = Post.create(title: 'Me')
    post.comments.create(text: 'On my birthday')
  end

  scenario 'a user can like a post, which updates the like count', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 Like')
  end

  scenario 'a user cannot like a post if she has already liked it' do 
    visit '/posts'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content("You've already liked this post!")    
  end  

end