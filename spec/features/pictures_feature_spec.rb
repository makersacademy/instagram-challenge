require 'rails_helper'

feature 'pictures' do

  context 'user not signed in' do
    it 'redirects them to the login page when they try to add a picture' do
      visit '/pictures/new'
      expect(current_path).to eq '/users/sign_in'
    end

    it 'does not display "Add picture" link on the homepage' do
      visit '/'
      expect(page).not_to have_content 'Add picture'
    end
  end

  context 'user signed in' do

    before do
      visit '/'
      sign_up
    end

    it 'lets a user to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures to display'
      expect(page).to have_link 'Add picture'
    end

    it 'lets the user add a picture that is then displayed' do
      visit '/pictures'
      add_picture
      expect(page).to have_selector("img[src*=test]")
    end

    it 'lets the user add a caption when adding a picture' do
      visit '/pictures'
      add_picture
      expect(page).to have_content("First pic")
    end

    scenario 'user must be logged in to upload a picture' do
      visit '/pictures'
    end

    context 'with a picture uploaded' do

      before do
        visit '/pictures'
        add_picture
      end

      it 'lets the user see a full size version of the picture' do
        visit '/pictures'
        find("img[src*=test]").click
        expect(page).to have_selector("img[src*=test]")
        expect(current_path).not_to eq '/restaurants'
      end

      it 'lets the user delete a picture' do
        visit '/pictures'
        click_link 'Delete'
        expect(page).not_to have_selector("img[src*=test]")
      end

      it 'lets the user edit a caption' do
        visit '/pictures'
        click_link 'Edit'
        attach_file 'picture_image', Rails.root + 'spec/features/test.jpg'
        fill_in "Caption", with: 'New caption'
        click_button 'Upload picture'
        expect(page).to have_content('New caption')
        expect(page).not_to have_content('First pic')
      end
    end
  end
end
