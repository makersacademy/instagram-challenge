require 'rails_helper'

feature 'photos' do

  context 'no user is logged in' do
    context 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_content 'No photos yet'
        expect(page).to have_link 'Add a photo'
      end
    end

    context 'photos have been added' do
      before do
        @surfing = Photo.create(caption:'surfing.jpg')
        @swimming = Photo.create(caption:'swimming.jpg')
      end

      scenario 'display photos' do
        visit '/photos'
        expect(page).to have_content('surfing')
        expect(page).not_to have_content('No photos yet')
      end

      context 'viewing photos' do
        scenario 'lets a user view a photo' do
          visit '/photos'
          click_link 'View swimming'
          expect(page).to have_content 'swimming'
          expect(current_path).to eq "/photos/#{@swimming.id}"
        end
      end

      context 'adding photos' do
        visit '/photos'
        click_link 'Add a photo'
        expect(page).to have_content('You must sign in or sign up before continuing')
      end

      context 'editing photos' do
        visit '/photos'
        click_link 'Edit swimming'
        expect(page).to have_content('You must sign in or sign up before continuing')
      end

      context 'deleting photos' do
        visit '/photos'
        click_link 'Delete swimming'
        expect(page).to have_content('You must sign in or sign up before continuing')
      end
    end

    context 'user logged in' do
      context 'adding photos' do
        scenario 'prompts user to fill out a form, then displays the new photo' do
          visit '/photos'
          click_link 'Add a photo'
          fill_in 'Caption', with: 'image'
          click_button 'Create Photo'
          expect(page).to have_content 'image'
          expect(current_path).to eq '/photos'
        end
      end

      context 'editing photos' do
        scenario 'let a user edit a photo' do
          visit '/photos'
          click_link 'Edit surfing'
          fill_in 'Caption', with: 'surfinG'
          click_button 'Update Photo'
          click_link 'View surfinG'
          expect(page).to have_content 'surfinG'
          expect(current_path).to eq "/photos/#{@surfing.id}"
        end
      end

      context 'deleting photos' do

        before { Photo.create caption: 'myImage' }
        scenario 'removes a photo when a user clicks a delete link' do
          visit '/photos'
          click_link 'Delete myImage'
          expect(page).not_to have_content 'myImage'
          expect(page).to have_content 'Photo deleted successfully'
        end
      end
    end
  end
end
