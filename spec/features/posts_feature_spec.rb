require 'rails_helper'
require 'web_helper'

feature 'posts' do
  context 'no posts have been added' do
    it 'should display a prompt to add a post' do
      sign_up
      expect(page).to have_content 'No posts as of yet'
      expect(page).to have_link 'New Post'
    end
  end

  context 'creating a post' do
    it 'prompts user to fill out a form and displays the new post' do
      sign_up
      create_post
      expect(page).to have_content 'Burger'
      expect(current_path).to eq '/'
    end
  end

  context 'viewing posts' do

    let!(:burger){Post.create(description:'Burger')}

    it 'lets a user view a post' do
     visit '/posts'
     click_link 'Burger'
     expect(page).to have_content 'Burger'
     expect(current_path).to eq "/posts/#{burger.id}"
    end
  end

  context 'editing posts' do

    it 'let a user edit a post' do
     sign_up
     create_post
     click_link 'Edit'
     fill_in 'Description', with: 'Burger King'
     click_button 'Update Post'
     expect(page).to have_content 'Burger King'
     expect(current_path).to eq '/posts'
    end
  end

  context 'deleting posts' do

    it 'removes a post when a user clicks a delete link' do
      sign_up
      create_post
      click_link 'Delete'
      expect(page).not_to have_content 'Burger'
      expect(page).to have_content 'Post deleted successfully'
    end
  end
end
