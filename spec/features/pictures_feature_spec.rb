require 'rails_helper'

feature 'pictures' do
  before do
    @user = create :user
    @user2 = create :user2
    sign_in(@user)
  end
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'creating a picture with descriptions' do
    scenario 'users can add a picture with descriptions' do
      post_picture
      expect(current_path).to eq '/pictures'
      expect(page).to have_selector 'img'
      expect(page).to have_content 'Nice'
      expect(page).to have_content 'successfully created'
    end

    scenario 'user cannot post without attaching a picture' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Description', with: 'Nice'
      click_button 'Post'
      expect(page).to have_content 'error'
      expect(page).not_to have_content 'successfully created'
    end

    context 'user not signed in' do
      scenario 'user cannot post without sign in' do
        visit '/pictures'
        click_link 'Sign out'
        click_link 'Add a picture'
        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content 'You need to sign in or sign up before continuing'
      end
    end
  end

  context 'editing descriptions' do
    scenario 'user can edit descriptions', js: true do
      post_picture
      click_link 'Edit'
      fill_in 'Description', with: 'Great'
      click_button 'Post'
      expect(page).not_to have_content 'Nice'
      expect(page).to have_content 'Great'
      expect(page).to have_content 'successfully updated'
    end

    scenario 'other users cannot see the edit link' do
      post_picture
      click_link 'Sign out'
      sign_in(@user2)
      expect(page).not_to have_link 'Edit'
    end
  end

  context 'deleting a picture' do

    before do
      post_picture
    end

    scenario 'user can delete a picture' do
      click_link 'Delete'
      expect(current_path).to eq '/pictures'
      expect(page).not_to have_selector 'img'
      expect(page).not_to have_content 'associations'
      expect(page).not_to have_content 'Nice'
      expect(page).to have_content 'successfully deleted'
    end

    scenario 'comment gets deleted when deleting a picture' do
      click_link 'Create comment'
      fill_in 'Content', with: 'Great'
      click_button 'Comment'
      click_link 'Delete'
      expect(page).not_to have_content 'Great'
    end

    scenario 'other users cannot see the delete link' do
      click_link 'Sign out'
      sign_in(@user2)
      expect(page).not_to have_link 'Delete'
    end
  end

end
