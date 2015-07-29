require 'rails_helper'

feature 'Photos' do
  context 'with no uploaded photos' do
    it 'A user can view the homepage' do
      visit '/'
      expect(page).to have_content 'No photos yet'
    end

    context 'when signed in' do
      before(:each) do
        user = build(:user)
        sign_up_as(user)
      end

      it 'A user is prompted to upload a photo' do
        click_link 'Upload photo'
        expect(page).to have_content 'Upload photo here'
      end
    end
  end

  context 'with uploaded photos' do

    context 'when signed in' do

      before(:each) do
        user = build(:user)
        sign_up_as(user)
      end

      it 'uploaded photos are displayed in reverse chronological order' do
        upload_photo './spec/test_images/Honda-Gold-Wing-White.jpg'
        upload_photo './spec/test_images/GoldWing_2015_09.jpg'
        upload_photo './spec/test_images/honda-gold-wing-airbag-2.jpg'

        visit root_path

        expect(page).to have_content 'Uploaded at'
      end
    end
  end

  context 'deleting photos' do

    context 'when signed in' do

      before(:each) do
        user = build(:user)
        sign_up_as(user)
      end

      it 'A user can delete their photos' do
        upload_photo './spec/test_images/Honda-Gold-Wing-White.jpg'

        visit root_path
        click_link 'Delete'

        expect(page).to have_content 'Photo successfully deleted'
      end

      it 'a user cannot delete other people\'s phtotos' do

      end
    end
  end
end

def upload_photo photo_string
  visit new_photo_path
  attach_file 'photo[gram]', photo_string
  click_button 'Create Photo'
end
