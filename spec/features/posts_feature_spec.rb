require 'rails_helper'

feature 'Posts' do
  context 'No posts' do
    scenario 'Should display a prompt to add a new post' do
      sign_up
      expect(page).to have_content "No posts yet"
      expect(page).to have_button "Add a post"
    end
  end

  context 'At least one post has been added' do
    before do
      sign_up
      create_post
    end

    scenario 'Posts are displayed on the posts page' do
      visit '/posts'
      expect(page).to have_content "handsome chap"
      expect(page).not_to have_content "No posts yet"
    end
  end

  context 'Creating posts' do
    before do
      sign_up
    end

    scenario 'User can add a post and see it on the posts page' do
      create_post
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'handsome chap'
    end

    scenario 'Posts cannot be created without a caption shorter than 3 characters' do
      create_post(caption: 'zz')
      expect(page).not_to have_content 'zz'
      expect(page).to have_content 'error'
    end

    scenario 'User sees a success message with successful posts' do
      create_post
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Your image was successfully posted to Instagram'
    end
  end

  context 'Viewing posts' do
    before do
      sign_up
      create_post
    end

    scenario 'Posts display the creator of a post' do
      expect(page).to have_content 'Posted by jonny@mail.com'
    end
  end

  context 'Editing posts' do
    before do
      sign_up
      create_post
    end

    scenario 'Users can edit image captions if they created post' do
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Edit caption'
    end

    scenario 'Users CANNOT edit an image caption if they did not create the post' do
      click_link 'Sign out'
      sign_up(email: 'different@user.com')
      visit '/posts'
      expect(page).not_to have_content 'Edit caption'
    end

  end

  context 'Deleting posts' do
    before do
      sign_up
      create_post
    end

    scenario 'Users can delete posts if they created post' do
      expect(current_path).to eq '/posts'
      expect(page).to have_content 'Delete post'
    end

    scenario 'Users CANNOT delete a post if they did not create the post' do
      click_link 'Sign out'
      sign_up(email: 'different@user.com')
      visit '/posts'
      expect(page).not_to have_content 'Delete post'
    end
  end

end
