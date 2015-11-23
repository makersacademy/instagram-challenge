require 'rails_helper'

feature 'Comments' do

  let (:user) { create :user }
  before { log_in(user) }


  context 'when there are no comments' do

    scenario 'can add a comment to a picture when signed in' do
      leave_comment
      expect(page).to have_content 'I am a comment'
    end

    scenario 'cannot add a comment if not loged in' do
      leave_comment
      click_link 'Log out'
      click_link 'Duck'
      fill_in 'New comment', with: 'I am comment number 2'
      click_button 'Leave comment'
      expect(page).to have_content 'Please log in or register to leave a comment.'
    end

  end

  context 'when there is a comment' do

    scenario 'can edit the comment' do
      leave_comment
      edit_comment
      expect(page).not_to have_content 'I am a comment'
      expect(page).to have_content "There is a comment"
      expect(page).to have_content "You have successfully updated the comment."
    end

    scenario "cannot edit someone else's comment" do
      user2 = create :user, email: 'test2@example.com'
      leave_comment
      click_link 'Log out'

      log_in(user2)
      click_link 'Duck'
      edit_comment
      expect(page).to have_content "Cannot edit someone else's comment"
      expect(page).to have_content 'I am a comment'

    end

    scenario 'can delete a comment when signed in' do
      leave_comment
      click_link 'Delete comment'
      expect(page).not_to have_content 'I am a comment'
    end

    scenario "cannot delete someone else's comment" do
      user2 = create :user, email: 'test2@example.com'
      leave_comment
      click_link 'Log out'
      
      log_in(user2)
      click_link 'Duck'
      click_link 'Delete comment'
      expect(page).to have_content 'I am a comment'
      expect(page).to have_content "Cannot delete someone else's comment"
    end

  end

end
