require 'rails_helper'

feature 'posts' do

  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/posts'
      expect(page).to have_content 'No posts yet!'
      expect(page).to have_link 'Add a post'
    end
  end


  context 'adding posts' do
    scenario 'should be able to post' do
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Sunset'
      attach_file 'Image', 'spec/images/test_pic.jpeg'
      click_button 'Create Post'
      expect(page).to have_content 'Sunset'
      expect(page).not_to have_content 'No posts yet!'
      expect(Post.count).to eq 1
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do
    before do 
      visit '/posts'
      click_link 'Add a post'
      fill_in 'Title', with: 'Sunset'
      attach_file 'Image', 'spec/images/test_pic.jpeg'
      click_button 'Create Post'
    end 

    scenario 'lets a user view a post' do
      visit '/posts'
      expect(page).to have_content 'Sunset'
    end
  end

  # context 'editing posts' do
  #   before do 
  #     visit '/posts'
  #     click_link 'Add a post'
  #     fill_in 'Title', with: 'Sunset'
  #     attach_file 'Image', 'spec/images/test_pic.jpeg'
  #     click_button 'Create Post'
  #   end

  #   scenario 'User can edit a post' do
  #     visit '/posts'
  #     click_link 'Picture'
  #     click_link 'Edit Sunset'
  #     fill_in 'post_title', with: 'AMAZING sunset'
  #     click_button 'Update Post'
  #     expect(page).to have_content 'AMAZING sunset'
  #     expect(current_path). to eq '/posts'
  #   end
  # end

  # context 'deleting posts' do
  #   before do 
  #     visit '/posts'
  #     click_link 'Add a post'
  #     fill_in 'Title', with: 'Sunset'
  #     attach_file 'Image', 'spec/images/test_pic.jpeg'
  #     click_button 'Create Post'
  #   end

  #   scenario 'User can remove a post when a user clicks a delete link' do
  #     visit '/posts'
  #     find('img').click
  #     click_link 'Delete Sunset'
  #     expect(page).not_to have_content 'Sunset'
  #     expect(page).to have_content 'Post deleted successfully'
  #   end
  # end

end