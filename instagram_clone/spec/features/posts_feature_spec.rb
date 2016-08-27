require 'rails_helper'

feature 'Posts' do
  context 'No posts' do
    scenario 'Should display a prompt to add a new post' do
      visit '/posts'
      expect(page).to have_content "No posts yet"
      expect(page).to have_content "Add a post"
    end
  end

  context 'At least one post has been added' do
    before do
      Post.create(caption: "view from the villa")
    end

    scenario 'Posts are displayed on the posts page' do
      visit '/posts'
      expect(page).to have_content "view from the villa"
      expect(page).not_to have_content "No posts yet"
    end
  end

  context 'Creating posts' do
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
  #   let!(:villa){ Post.create(caption: "what a view") }
  #
  #   scenario 'Users can click on caption and be taken to view a specific post' do
  #     visit '/posts'
  #     # SOMEHOW CLICK THE IMAGE
  #     expect(page).to have_content "what a view"
  #     expect(current_path).to eq "/posts/#{villa.id}"
  #   end
  end

  context 'Editing posts' do
    before { Post.create(caption: "what a view") }

    scenario 'Users can edit image captions' do
      visit '/posts'
      click_link 'Edit caption'
      fill_in 'Caption', with: "the view from our villa"
      click_button 'Update Post'
      expect(page).to have_content "the view from our villa"
      expect(page).not_to have_content "what a view"
      expect(current_path).to eq '/posts'
    end
  end

  context 'Deleting posts' do
    before { Post.create(caption: "what a view") }

    scenario 'Users can delete a post' do
      # I WOULD RATHER THIS WAS A FEATURE ON THE INDIVIDUAL POST PAGE
      visit '/posts'
      click_link 'Delete post'
      expect(page).not_to have_content "what a view"
      expect(page).to have_content "Your post has successfully been removed from Instagram"
    end
  end

end
