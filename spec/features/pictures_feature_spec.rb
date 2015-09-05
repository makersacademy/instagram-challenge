require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'displays a link to add a new picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet!')
      expect(page).to have_content('Add a new picture')
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(caption: 'Awesome narwhal', image_file_name: 'spec/assets/images/image01.png')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('Awesome narwhal')
      expect(page).to have_selector('img')
    end
  end

  context 'uploading pictures' do
    scenario 'user writes a caption, then new picture and caption displayed' do
      visit '/pictures'
      click_link 'Add a new picture'
      fill_in 'Caption', with: 'Awesome narwhal'
      attach_file 'picture[image]', 'spec/assets/images/image01.png'
      click_button 'Create Picture'
      expect(page).to have_content('Awesome narwhal')
      expect(page).to have_selector('img')
    end
  end

  context 'editing captions' do
    before do
      Picture.create(caption: 'Awesome narwhal', image_file_name: 'spec/assets/images/image01.png')
    end

    scenario 'user is able to edit their picture captions' do
      visit '/pictures'
      click_link 'Edit caption'
      fill_in 'Caption', with: 'Amazing narwhal!'
      click_button 'Update Picture'
      expect(page).to have_content('Amazing narwhal!')
    end
  end

  context 'deleting images' do
    before do
      Picture.create(caption: 'Awesome narwhal', image_file_name: 'spec/assets/images/image01.png')
    end

    scenario 'user is able to delete their pictures' do
      visit '/pictures'
      click_link 'Delete image'
      expect(page).not_to have_content('Awesome narwhal')
      expect(page).not_to have_selector('img')
      expect(page).to have_content('Image successfully deleted')
    end
  end
end