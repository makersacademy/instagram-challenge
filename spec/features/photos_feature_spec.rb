require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do

    scenario 'should display a prompt to add a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos to display yet'
      expect(page).to have_link 'Add Photo'
    end
  end

  before do
    Timecop.freeze(Time.new(2017, 5, 6, 15, 0, 0))
  end

  context 'user is not logged in' do

    scenario 'so cannot upload a photo' do
      visit '/'
      click_link 'Add Photo'
      expect(current_path).to eq '/users/sign_in'
    end

    before do
      sign_up
      upload_photo
      click_link 'Sign Out'
    end

    context 'photos have been added' do

      scenario 'display photos' do
        visit '/'
        expect(page).to have_css('img')
        expect(page).not_to have_content('No photos yet')
      end
    end

    context 'viewing photos' do

      scenario 'lets a user view a photo' do
        visit '/'
        click_link('', href: "#{photo_path(Photo.last)}")
        expect(page).to have_content 'Avocado and Scrambled eggs #Living'
        expect(page).to have_content 'less than a minute ago'
        expect(page).to have_css 'img'
        expect(page).to have_content '0 likes'
        expect(current_path).to eq "/photos/#{Photo.last.id}"
      end
    end

    context 'editing photos' do
      scenario 'cannot update photos' do
        click_link('', href: "#{photo_path(Photo.last)}")
        expect(page).not_to have_link 'Update Photo'
      end
    end

    context 'deleting photos' do
      scenario 'cannot delete photos' do
        click_link('', href: "#{photo_path(Photo.last)}")
        expect(page).not_to have_link 'Delete Photo'
      end
    end

  end

  context 'user is logged in' do
    before { sign_up }

    context 'uploading photos' do

      scenario 'prompts user to fill out form, then displays the new photo' do
        visit '/'
        click_link 'Add Photo'
        fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
        fill_in 'Location', with: 'Somewhere pretentious'
        attach_file('choose-file', Rails.root + "spec/fixtures/rick-astley.jpg")
        click_button 'Upload Photo'
        click_link('', href: "#{photo_path(Photo.last)}")
        expect(page).to have_content 'Avocado and Scrambled eggs #Living'
        expect(page).to have_content 'Somewhere pretentious'
        expect(page).to have_content 'less than a minute ago'
        expect(page).to have_css 'img'
        expect(current_path).to eq "/photos/#{Photo.last.id}"
      end

      context 'incorrectly' do

        scenario 'does not let you sumbit a photo without uploading a file' do
          visit '/photos'
          click_link 'Add Photo'
          fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
          fill_in 'Location', with: 'Somewhere pretentious'
          click_button 'Upload Photo'
          expect(page).not_to have_content 'Avocado and Scrambled eggs #Living'
          expect(page).to have_content 'error'
        end
      end
    end

    context 'editing photos' do

      scenario 'lets the owner update a photo' do
        upload_photo
        visit "/photos/#{Photo.last.id}"
        click_link 'Update Photo'
        fill_in 'Caption', with: 'Yummy Breakfast #HealthQueen'
        fill_in 'Location', with: 'Somewhere even more pretentious'
        click_button 'Update Photo'
        click_link('', href: "#{photo_path(Photo.last)}")
        expect(page).to have_content 'Yummy Breakfast #HealthQueen'
        expect(page).to have_content 'Somewhere even more pretentious'
        expect(page).not_to have_content 'Avocado and Scrambled eggs #Living'
      end

      scenario 'cannot edit photo unless owner' do
        upload_photo
        click_link 'Sign Out'
        sign_up(username: 'visitor99', email: 'visitor@test.com')
        visit "/photos/#{Photo.last.id}"
        expect(page).not_to have_link 'Update Photo'
      end
    end

    context 'deleting photos' do

      scenario 'removes a photo when owner clicks a delete link' do
        upload_photo
        visit "/photos/#{Photo.last.id}"
        click_link 'Delete Photo'
        expect(page).not_to have_content 'Avocado and Scrambled eggs #Living'
        expect(page).to have_content 'Photo deleted successfully'
      end

      scenario 'cannot delete photo unless owner' do
        upload_photo
        click_link 'Sign Out'
        sign_up(username: 'visitor', email: 'visitor@test.com')
        visit "/photos/#{Photo.last.id}"
        expect(page).not_to have_link 'Delete Photo'
      end

    end
  end
end
