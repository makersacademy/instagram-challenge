require "rails_helper"

feature 'pictures' do

  context 'no pictures have been added' do
    it 'should display a prompt to add a picture' do
      visit('/pictures')
      expect(page).to have_content('No pictures yet')
      expect(page).to have_link('Upload a picture')
    end
  end

  context 'pictures have been added' do
    before do
      sign_up
      upload_picture
    end

    scenario 'display pictures' do
      visit('/pictures')
      expect(page).to have_content('Test caption')
      expect(page).not_to have_content('No pictures yet')
    end

  end


  context 'creating pictures' do

    scenario 'goes to sign in screen if user tries to upload picture and is not signed in' do
      visit('/pictures')
      click_link 'Upload a picture'
      expect(current_path).to eq '/users/sign_in'
    end

    scenario 'prompts user to fill out form and display picture' do
      sign_up
      upload_picture
      expect(page).to have_content('test@example.com')
      expect(page).to have_content('Test caption')
      expect(page).to have_content('London')
      expect(current_path).to eq('/pictures')
    end
  end

  context 'deleting pictures' do

    before do
      sign_up
      upload_picture
    end

    scenario 'removes a picture' do
      click_link 'Delete'
      expect(page).not_to have_content('Test caption')
      expect(page).to have_content 'Picture deleted successfully'
    end

    scenario 'can not remove a picture if you did not upload it' do
      click_link 'Sign out'
      sign_up(email:'test2@example.com', password:'testpassword')
      click_link 'Delete'
      expect(page).to have_content('Test caption')
      expect(page).to have_content 'You can not delete another user\'s picture'
    end
  end
end
