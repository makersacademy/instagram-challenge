require 'rails_helper'

feature 'commenting' do

  context 'adding a new comment' do

    before do
      user = User.create email: 'natso@gmail.com', password: '12345678', password_confirmation: '12345678'
      login_as user
      @photo = Photo.create(description:'nice', image_file_name:'spec/fixtures/files/gramophone.png')
    end

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
      click_link 'Comment on photo'
      expect(current_path).to eq '/users/sign_in'
      expect(page).to have_content('You need to sign in or sign up before continuing')
    end
  end
end