require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'restaurants have been added' do

  before do
    Post.create(content: 'Hello world')
  end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('Hello world')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
  scenario 'prompts user to fill out a form, then displays the new post' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'Content', with: 'Hello World'
    click_button 'Create Post'
    expect(page).to have_content 'Hello World'
    expect(current_path).to eq '/posts'
  end
end

  context 'viewing posts' do

  scenario 'lets a user view a post' do
     post = Post.create(content: 'hey')
     visit '/posts'
     click_link 'hey'
     expect(page).to have_content 'hey'
     expect(current_path).to eq "/posts/#{post.id}"
  end

  context 'editing posts' do

  scenario 'let a user edit a post' do
   post = Post.create(content: 'hey')
   visit '/posts'
   click_link 'Edit hey'
   fill_in 'Content', with: 'hello'
   click_button 'Update Post'
   expect(page).to have_content 'hello'
   expect(current_path).to eq '/posts'
  end

end

  context 'deleting posts' do

    scenario 'removes a post when a user clicks a delete link' do
      post = Post.create(content: 'hey')
      visit '/posts'
      click_link 'Delete hey'
      expect(page).not_to have_content 'hey'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end

end
