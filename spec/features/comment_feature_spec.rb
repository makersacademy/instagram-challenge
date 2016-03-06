require 'rails_helper'

feature 'commenting' do

  scenario 'allows users to leave a comment on a photo' do
     visit '/'
     sign_up('harry@test.com', '12345678')
     upload
     comment

     expect(current_path).to eq '/photos'
     expect(page).to have_content('so cool')
  end

  context 'deleting comments' do

    scenario 'can be done through the website' do
      visit '/'
      sign_up('harry@test.com', '12345678')
      upload
      comment
      click_link 'Delete comment'
      expect(page).not_to have_content 'so cool'
      expect(page).to have_content 'Comment deleted successfully'
    end

    scenario 'a user can only delete their own comments' do
      visit '/'
      sign_up('harry@test.com', '12345678')
      upload
      comment
      click_link 'Sign out'
      sign_up('sid@sloth.com', 'password123')
      click_link 'Delete comment'
      expect(page).to have_content 'so cool'
      expect(page).to have_content 'This is not your comment to delete'
    end
  end



end
