require 'rails_helper'

feature 'photos' do

  context 'no pictures have been added' do

    it 'should display a prompt to add pictures' do
      visit '/'
      expect(page).to have_content 'No Photos Added'
      expect(page).to have_link 'Add a Photo'
    end

  end

  context 'photos have been added' do

    before do
      Photo.create(name: '5 pounds', description: 'Imperial')
    end

    it 'should display the photos' do
      visit('/photos')
      expect(page).to have_content '5 pounds'
      expect(page).to have_content 'Imperial'
    end

  end

  context 'creating photos' do

    it 'asks the user to fill in a form to create a photo, then adds the photo to the page' do
      user_signup('email@email.com')
      visit '/'
      click_link 'Add a Photo'
      create_photo('1 ounce', 'a 1 ounce weight')
      expect(page).to have_content '1 ounce'
      expect(page).to have_content 'a 1 ounce weight'
      expect(page).to have_css("img[src*='ounce_weight.jpg']")
    end

    it 'only allows users to upload a file up to 3mb' do
      user_signup('email@email.com')
      visit '/'
      click_link 'Add a Photo'
      fill_in 'Name', with: 'Too big photo'
      fill_in 'Description', with: 'a photo that is too big'
      attach_file "Image", Rails.root.join('spec','images','Geometric_building.jpeg')
      click_button 'Create Photo'
      expect(page).to have_content('File too large')
      expect(page).not_to have_content('Too big photo')
    end

    context 'user is not logged in' do

      it 'does not let a user that is not logged in add a restaurant' do
        visit '/photos'
        click_link 'Add a Photo'
        expect(current_path).to eq '/users/sign_in'
        expect(page).to have_content 'Log in'
        expect(page).to have_content 'ou need to sign in or sign up before continuing'
      end

    end
  end

  context 'editing photos' do

    before do
      user_signup('email@email.com')
      create_photo('1 ounce', 'a 1 ounce weight')
    end

    scenario 'let a user edit a photo' do
      click_link 'Edit 1 ounce'
      fill_in 'Name', with: 'Not one ounce!'
      click_button 'Update Photo'
      expect(page).to have_content 'Not one ounce!'
      expect(page).to have_content 'Photo successfully updated'
    end

    scenario 'does not let a user edit a photo they did not create' do
      click_link 'Sign out'
      user_signup('someonenew@email.com')
      click_link 'Edit 1 ounce'
      fill_in 'Name', with: 'Not one ounce!'
      click_button 'Update Photo'
      expect(page).to have_content '1 ounce'
      expect(page).to have_content "Cannot edit other users photo's"
    end

  end

  context 'deleting photos' do

    before do
      user_signup('email@email.com')
      create_photo('1 ounce', 'a 1 ounce weight')
    end

    scenario 'lets a user delete a photo' do
      click_link 'Delete 1 ounce'
      expect(page).not_to have_content '1 ounce'
      expect(page).to have_content 'Photo successfully deleted'
    end

    scenario 'does not let a user delete a photo they did not create' do
      click_link 'Sign out'
      user_signup('someonenew@email.com')
      click_link 'Delete 1 ounce'
      expect(page).to have_content '1 ounce'
      expect(page).to have_content "Cannot delete other users photo's"
    end

  end

end
