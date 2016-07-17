require 'rails_helper'

feature 'posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit posts_path
      expect(page).to have_content 'No posts yet'
      expect(page).to have_button 'Add a Picture'
    end
  end

  context 'create posts' do
    scenario 'uploads a picture' do
      sign_up
      create_post
      expect(page).to have_content 'PIC'
      expect(page).to_not have_content 'Description_text'
      expect(page).to have_content 'Post created successfully'
      expect(current_path).to eq posts_path
    end

    scenario 'does not let user submit a title that is too short' do
      sign_up
      create_post_invalid_title
      expect(page).not_to have_css 'h2', text: 'PI'
      expect(page).to have_content 'error'
    end

    scenario 'does not let user submit without a image' do
      sign_up
      create_post_no_image
      expect(page).not_to have_css 'h2', text: 'PIC'
      expect(page).to have_content 'error'
    end
  end

  # context "comments and likes" do
  #   scenario 'users can like posts' do
  #   end
  #
  #   scenario 'users can add comments' do
  #   end
  # end

  context 'viewing a post' do
    scenario 'user can view a post with description' do
      sign_up
      create_post
      click_link 'PIC'
      expect(page).to have_content 'PIC'
      expect(page).to have_content 'Description_text'
    end
  end

  context "editing a post" do
    scenario 'user can edit a post description' do
      sign_up
      create_post
      edit_post
      expect(page).to have_content 'edited PIC'
      expect(page).to have_content 'edited Description'
      expect(page).to have_content 'Post updated successfully'
    end

    scenario "only onwer can edit a post description" do
      sign_up
      create_post
      click_link 'Sign out'
      sign_up_diff_user
      edit_post
      expect(page).to have_content 'PIC'
      expect(page).to have_content 'Description'
      expect(page).to have_content 'You must be the owner to update a post description'
    end
  end

  context "deleting a post" do
    scenario 'user can delete a post' do
      sign_up
      create_post
      click_link 'PIC'
      click_button 'Delete'
      expect(page).not_to have_content 'PIC'
      expect(page).not_to have_content 'Description_text'
      expect(page).to have_content 'Post deleted successfully'
    end

    scenario "only onwer can delete a post" do
      sign_up
      create_post
      click_link 'Sign out'
      sign_up_diff_user
      click_link 'PIC'
      click_button 'Delete'
      expect(page).to have_content 'PIC'
      expect(page).to have_content 'Description_text'
      expect(page).to have_content 'You must be the owner to delete a post'
    end
  end
end
