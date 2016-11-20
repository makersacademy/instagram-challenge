require 'rails_helper'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(description: 'I have posted this thing')
    end

    scenario 'display post' do
      visit '/posts'
      expect(page).to have_content('I have posted this thing')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'post_description', with: 'Test post'
      click_button 'Create Post'
      expect(page).to have_content 'Test post'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    let!(:test_post){ Post.create(description:'Test post') }

    scenario 'lets a user view a post' do
     visit '/posts'
     click_link 'Test post'
     expect(page).to have_content 'Test post'
     expect(current_path).to eq "/posts/#{test_post.id}"
    end
  end
end
