require 'rails_helper'

feature 'photos' do 

  def sign_up_with(email)
    visit('/')
    click_link('Sign up')
    fill_in('Email', with: email)
    fill_in('Password', with: 'testttest')
    fill_in('Password confirmation', with: 'testttest')
    click_button('Sign up')
  end

  def post_photo(caption)
    click_link 'Post a photo'
    fill_in 'Caption', with: caption
    click_button 'Post photo'
  end

  context 'no photos have been added' do 
    scenario 'should display a prompt to add a photo' do 
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Post a photo'
    end
  end  

  context 'photo have been added' do
    before do
      Photo.create(caption: 'sunrise')
    end

    scenario 'display photos' do
      visit '/photos'
      expect(page).to have_content('sunrise')
      expect(page).not_to have_content('No restaurants yet')
    end
  end

  context 'posting photos' do
    scenario 'prompts user to fill out a form, then displays the new photo caption' do
      sign_up_with('test@example.com')
      post_photo('sunrise')
      expect(page).to have_content 'sunrise'
      expect(current_path).to eq '/photos'
    end

    scenario 'users can only post a photo if they are signed in' do
      visit '/photos'
      click_link 'Post a photo'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'viewing photos' do
    let!(:sunrise){Photo.create(caption:'sunrise')}

    scenario 'lets a user view a photo' do
     visit '/photos'
     click_link 'sunrise'
     expect(page).to have_content 'sunrise'
     expect(current_path).to eq "/photos/#{sunrise.id}"
    end
  end

  context 'editing photo captions' do
    scenario 'lets a user edit a photo caption' do
     sign_up_with('test@example.com')
     post_photo('sunrise')
     click_link 'Edit sunrise'
     fill_in 'Caption', with: 'amazing sunrise'
     click_button 'Update Caption'
     expect(page).to have_content 'amazing sunrise'
     expect(current_path).to eq '/photos'
    end
  end

  context 'deleting photos' do
    scenario 'removes a photo when a user clicks a delete link' do
      sign_up_with('test@example.com')
      post_photo('sunrise')
      click_link 'Delete sunrise'
      expect(page).not_to have_content 'sunrise'
      expect(page).to have_content 'Photo deleted successfully'
    end

    scenario 'deleting a photo also deletes any associated comments' do
      sign_up_with('test@example.com')
      post_photo('sunrise')
      click_link 'Leave a comment'
      fill_in "Comment", with: "nice photo"
      click_button 'Leave Comment'
      click_link 'Delete sunrise'
      expect(page).not_to have_content 'sunrise'
      expect(page).not_to have_content 'nice photo'
    end

    scenario 'can only delete a photo if created by user' do
      sign_up_with('test1@example.com')
      click_link 'Sign out'
      sign_up_with('test2@example.com')
      expect(page).not_to have_content('Delete sunrise')
    end
  end

end
