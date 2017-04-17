require 'rails_helper'

feature 'Posts:' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'Add a post'
    end
  end

  context 'posts have been added' do
    before do
      Post.create(description: 'One day on holiday!')
    end
    scenario 'display posts' do
      visit '/posts'
      expect(page).to have_content('One day on holiday!')
      expect(page).not_to have_content('No posts yet')
    end
  end

  context 'creating posts' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Description', with: 'One day on holiday!'
      click_button 'Create Post'
      expect(page).to have_content 'One day on holiday!'
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    let!(:test_post){Post.create(description:'One day on holiday!')}

    scenario 'lets a user view a post' do
     visit '/posts'
     click_link 'One day on holiday!'
     expect(page).to have_content 'One day on holiday!'
     expect(current_path).to eq "/posts/#{test_post.id}"
    end
  end

  context 'deleting posts' do
    before {Post.create(description:'One day on holiday!')}

    scenario 'removes a post when a user clicks a delete post' do
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content 'One day on holiday!'
      expect(page).to have_content 'Post deleted successfully'
    end

  end

end
