require 'rails_helper'

feature 'photos' do
  context 'no photos have been uploaded' do
    scenario 'displays a link to add photos' do
      visit '/'
      expect(page).to have_content 'No photos have been uploaded!'
      expect(page).to have_link 'Upload Photo'
    end


    # context 'uploading images' do
    #   scenario 'uploading an image' do
    #     visit '/'
    #     click_link 'Upload Photo'
    #     attach_file 'Image', 'spec/features/Ice.jpg'
    #     fill_in 'Caption', with: 'awesome'
    #     click_button 'Upload Photo'
    #     expect(page).to have_css("img[src*='Ice.jpg']")
    #     expect(page).to have_content 'awesome'
    #     expect(current_path).to eq '/photos'
    #   end
    # end

    context 'viewing individual pictures' do
      let!(:image){ Photo.create(title:'Icy', caption: 'awesome') }

      scenario 'lets a user view a picture' do
        visit '/'
        click_link 'Icy'
        expect(page).to have_content 'Icy'
        expect(current_path).to eq "/photos/#{image.id}"
      end
    end

    context 'editing photos' do
      before { Photo.create(title:'Icy', caption: 'awesome') }

      scenario 'let a user edit a photo' do
       visit '/'
       click_link 'Edit Icy'
       fill_in 'Title', with: 'Iced out'
       click_button 'Update Photo'
       expect(page).to have_content 'Iced out'
       expect(current_path).to eq '/photos'
      end
    end

    context 'deleting photos' do
      before { Photo.create(title:'Booya', caption: 'awesome') }

      scenario 'let a user delete a photo' do
       visit '/'
       click_link 'Booya'
       click_link 'Delete Booya'
       expect(page).not_to have_content 'Booya'
       expect(page).to have_content 'Photo deleted successfully'
       expect(current_path).to eq '/photos'
      end
    end

    context 'invalid photo uploads' do
      scenario 'user cannot upload a photo without a title' do
        visit '/'
        click_link 'Upload Photo'
        fill_in 'Title', with: ''
        attach_file 'Image', 'spec/features/Ice.jpg'
        click_button 'Upload Photo'
        expect(page).not_to have_css("img[src*='Ice.jpg']")
        expect(page).to have_content 'error'
      end

    end
  end
end
