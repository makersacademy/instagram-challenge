require 'rails_helper'


feature 'Upload pictures' do
  context 'Welcome Page' do
    scenario 'Welcome is displayed when loading the page' do
      visit '/'
      click_link('View Photos')
      expect(current_path).to eq('/photos')
      expect(page).to have_content("Add your photos and share you experiences!")
    end
  end

  context 'uploading photos' do
    scenario 'when a picture is uploaded, they should be displayed' do
      visit '/photos/new'

      fill_in('photo_name', with: 'Restaurant')
      fill_in('photo_description', with: 'mmmmmmmm')

      attach_file('photo_image', 'app/assets/images/holla_start_image.jpg')
      click_button('Save Photo')

      expect(current_path).to eq('/photos')

    end
  end
end
