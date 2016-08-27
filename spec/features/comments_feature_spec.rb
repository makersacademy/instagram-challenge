require 'rails_helper'

feature 'comments' do
  context 'commenting on a picture' do
    let!(:picture) { Picture.create(caption: 'a nice picture', image: File.new(Rails.root.join('spec','images','img.jpg'))) }

    scenario 'allows users to leave a comment' do
      sign_up
      leave_comment
      expect(page).to have_content 'it is a picture'
      expect(current_path).to eq "/pictures/#{picture.id}"
    end

    scenario 'user must be logged in to leave a comment' do
      visit '/pictures'
      find(:xpath, "//a/img[@alt='a nice picture']/..").click
      expect(page).not_to have_link 'Comment'
    end
  end

  context 'deleting comments' do
    scenario 'removes a comment when a user clicks a delete link' do
      sign_up
      post_picture
      leave_comment
      click_link 'Delete comment'
      expect(page).not_to have_content 'it is a picture'
      expect(page).to have_content 'Comment deleted successfully'
    end

    scenario 'users can only delete comment which they have created' do
      sign_up
      post_picture
      leave_comment
      click_link 'Sign out'
      sign_up_another_user
      visit '/pictures'
      first(:xpath, "//a/img[@alt='a nice picture']/..").click
      expect(page).not_to have_link 'Delete comment'
    end
  end
end