require 'rails_helper'

feature 'photos' do

  before do
    sign_up
  end
  
  context 'no photos have been added' do
    scenario 'should display a prompt to post a photo' do
      visit('/photos')
      expect(page).to have_content('No photos have been posted!')
      expect(page).to have_link('Post a Photo')
    end
  end

  context 'a photo has been added' do

    before do
      add_photo
    end

    scenario 'should display the photo caption and photo' do
      visit('/photos')
      expect(page).to have_css("img[src*='test']")
      expect(page).to have_content('Travelling')
      expect(page).not_to have_content('No photos have been posted!')
    end

    context 'deleting a post' do

      scenario 'removes a photo when a user clicks a delete link' do
        visit('/photos')
        click_link 'Delete'
        expect(page).to have_content('No photos have been posted!')
        expect(page).not_to have_content('Travelling')
      end
    end

    context 'editing a post' do

      scenario 'lets user edit their post' do
        visit('/photos')
        click_link('Edit')
        fill_in 'Caption', with: 'This has been edited'
        click_button('Update Photo')
        expect(page).to have_content('This has been edited')
        expect(page).not_to have_content('Travelling')
      end
    end

    context 'viewing a single post' do

      scenario 'lets a user click on an image to view that post' do
        # add_second_photo
        # visit('/photos')
        # photo_id = Photo.where(caption: 'Another photo').ids[0]
        # img = find(:css, "img[src*='another']")
        # img.click
        # save_and_open_page
        # expect(page).to have_css("img[src*='another']")
        # # expect(page).to have_content('Another photo')
        # # expect(page).not_to have_content("Travelling")
        # expect(current_path).to eq "photos/#{photo_id}"
      end
    end

  end

end
