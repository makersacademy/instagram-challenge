require 'rails_helper'

feature 'commenting' do
  before do
    @user = create :user
    @user2 = create :user2
    sign_in(@user)
    @picture = @user.pictures.create({picture_file_name: 'associations.jpg'})
  end

  context 'creating a comment' do
    scenario 'user can add a comment to a picture' do
      visit '/pictures'
      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
      expect(page).to have_content 'Great'
      expect(current_path).to eq '/pictures'
    end

    scenario 'user cannot post empty comment' do
      visit '/pictures'
      click_link 'Create comment'
      fill_in 'Content', with: ''
      click_button 'Comment'
      expect(page).not_to have_link 'Delete this comment'
      expect(page).to have_content 'You cannot post an empty comment'
    end
  end

  context 'deleting a comment' do
    before do
      visit '/pictures'
      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
    end
    scenario 'user can delete a comment' do
      visit '/pictures'
      click_link 'Delete this comment'
      expect(page).not_to have_content 'Great'
    end

    scenario 'other users cannot see the delete this review link' do
      click_link 'Sign out'
      sign_in(@user2)
      expect(page).not_to have_link 'Delete this comment'
    end
  end

  context 'user not signed in' do
    context 'creating comment' do
      scenario 'user cannot see "Create comment" link' do
        click_link 'Sign out'
        expect(page).not_to have_link 'Create comment'
      end
    end
  end
end
