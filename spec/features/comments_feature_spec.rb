require 'rails_helper'

feature 'Comment' do

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def leave_comment
    visit '/'
    click_link 'Love'
    click_link 'Leave a comment'
    fill_in 'Comment', with: 'I am a comment'
    click_button 'Leave comment'
  end

  let (:user) { create :user }
  let!(:picture) { Picture.create(name: 'Love', description: 'Do you love me?') }

  context 'when there are no comments' do

    scenario 'can add a comment to a picture when signed in' do
      sign_in(user)
      leave_comment
      expect(page.current_path).to eq "/pictures/#{picture.id}"
      expect(page).to have_content 'I am a comment'
    end

  end

  context 'when there is a comment' do

    scenario 'can edit the comment' do
      sign_in(user)
      leave_comment
      click_link 'Edit comment'
      fill_in 'Comment', with: "Let's say yes"
      click_button 'Edit comment'

      expect(page).not_to have_content 'Maybe I do'
      expect(page).to have_content "Let's say yes"
      expect(page).to have_content "You have successfully updated the comment."
    end

    scenario "cannot edit someone else's comment" do
      user2 = create :user, email: 'test2@example.com'
      sign_in(user)
      leave_comment
      click_link 'Sign out'

      sign_in(user2)
      click_link 'Love'
      click_link 'Edit comment'
      fill_in 'Comment', with: "Won't work"
      click_button 'Edit comment'
      expect(page).to have_content "Cannot edit someone else's comment"
      expect(page).to have_content 'I am a comment'

    end

    scenario 'can delete a comment when signed in' do
      sign_in(user)
      leave_comment
      # visit '/'
      # click_link 'Love'
      # click_link 'Leave a comment'
      # fill_in 'Comment', with: 'I am a comment'
      # click_button 'Leave comment'

      click_link 'Delete comment'
      expect(page).not_to have_content 'Maybe I do'
    end

    scenario 'cannot delete someone else\' comment' do
      user2 = create :user, email: 'test2@example.com'
      sign_in(user)
      leave_comment
      click_link 'Sign out'

      sign_in(user2)
      click_link 'Love'
      click_link 'Delete comment'
      expect(page).to have_content 'I am a comment'
      expect(page).to have_content 'Cannot delete someone else\'s comment'
    end

  end

end
