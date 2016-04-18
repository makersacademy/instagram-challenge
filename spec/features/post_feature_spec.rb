require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to make a new a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'restaurants have been added' do
    before do
      Post.create(description: "First post")
    end

    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('First post')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'New post'
      fill_in 'Description', with: 'First post'
      click_button 'Create Post'
      expect(page).to have_content 'First post'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

  let!(:firstpost){Post.create(description:'First post')}

    xscenario 'lets a user view a post' do
     visit '/posts'
     click_link(1)
     expect(page).to have_content 'First post'
     expect(current_path).to eq "/posts/#{firstpost.id}"
    end
  end

  context 'editing posts' do

  before { Post.create description: 'First post' }

    scenario 'let a user edit a post' do
     visit '/posts'
     click_link 'Edit'
     fill_in 'Description', with: 'This is my first post'
     click_button 'Update Post'
     expect(page).to have_content 'This is my first post'
     expect(current_path).to eq '/posts'
    end
  end
end