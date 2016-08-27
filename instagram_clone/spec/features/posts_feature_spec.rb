require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'displays a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New post'
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'New post'
      fill_in 'Title', with: 'First post'
      fill_in 'Description', with: 'great'
      click_button 'Create Post'
      expect(page).to have_content 'First post'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    let!(:first_post) {Post.create(title: 'First post', description: 'great')}
    scenario 'lets a user view a post' do
     visit '/posts'
     click_link 'First post'
     expect(page).to have_content 'First post'
     expect(current_path).to eq "/posts/#{first_post.id}"
    end
  end

  context 'editing posts' do

  before { create_post }

  scenario 'let a user edit a post' do
   visit '/posts'
   click_link 'Edit First post'
   fill_in 'Title', with: 'Updated First post'
   fill_in 'Description', with: 'even more great'
   click_button 'Create Post'
   expect(page).to have_content 'Updated First post'
   expect(current_path).to eq '/posts'
  end

end

end
