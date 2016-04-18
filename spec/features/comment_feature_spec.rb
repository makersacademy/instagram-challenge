require 'rails_helper'

feature 'Comment' do
  context 'User2 ist signed in and a image was uploaded by User1' do
    before do
      signup_user1
      upload_image1
      signout
      signup_user2
    end

    scenario 'Create comment' do
      click_link 'Comment'
      fill_in 'Comment', with: 'Wow what a great image'
      click_button 'Leave comment'
      expect(page).to have_content('Wow what a great image')
      expect(current_path).to eq('/')
    end

    scenario ' Delete comment' do
      leave_comment1
      click_link 'Delete comment'
      expect(page).to have_content('Comment was deleted')
      expect(page).not_to have_content('Wow what a great image')
      expect(current_path).to eq('/')
    end
  end
  
  context 'User 2 left a comment, User 1 is signed in' do
    before do
      signup_user1
      upload_image1
      signout
      signup_user2
      leave_comment1
      signout
    end

    scenario 'User1 cannot delete User 2 comment' do
      signin_user1
      expect(page).to_not have_link('Delete comment')
      expect(page).to have_content('Wow what a great image')
    end
  end
end