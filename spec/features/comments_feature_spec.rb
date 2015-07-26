require 'rails_helper'

feature 'commenting' do

  before do
    @user = User.create email: 'natso@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as @user
    @photo = Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png')
  end

  context 'adding a new comment' do
  	scenario 'allows users to comment using a form' do
      visit '/'
      click_link 'Comment on photo'
      fill_in 'Message', with: 'Nice'
      click_button 'Create Comment'
      expect(current_path).to eq '/photos'
      expect(page).to have_content('Nice')
    end

    scenario 'form must not be blank' do
      visit '/'
      click_link 'Comment on photo'
      click_button 'Create Comment'
      expect(current_path).to eq(new_photo_comment_path(@photo))
      expect(page).to have_content('Please enter a comment')
    end

    scenario 'must be logged in' do
      logout
      visit '/'
      expect(page).not_to have_selector(:link_or_button, 'Comment on photo')
      expect(page).to have_content('Please sign in to upload a photo')
    end
  end

  context 'deleting a comment' do
      
    scenario 'can delete own comment' do
      Comment.create(message:'cool pic', user_id: @user.id, photo_id: @photo.id)
      visit '/'
      click_link 'Delete comment'
      expect(page).not_to have_content('cool pic')
    end
  end
end