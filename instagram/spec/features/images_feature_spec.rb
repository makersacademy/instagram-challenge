require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add a image' do
      visit '/images'
      expect(page).to have_content 'No images yet'
      expect(page).to have_link 'Add a image'
    end
  end

  context 'images have been added' do
    scenario 'display images' do
      visit '/images'
      click_link 'Add a image'
      fill_in 'Caption', with: 'Test'
      attach_file "Image", "public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg"
      click_button 'Create Image'
      expect(page).to have_content('Test')
      expect(page).not_to have_content('No images yet')
    end
  end

  context 'creating images' do
    scenario 'prompts user to fill out a form, then displays the new image' do
      visit '/images'
      click_link 'Add a image'
      fill_in 'Caption', with: 'Test'
      attach_file "Image", "public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg"
      click_button 'Create Image'
      expect(page).to have_content 'Test'
      expect(page).to have_css("img[src*='AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg']")
      expect(current_path).to eq '/images'
    end

    context 'an invalid image' do
      scenario 'does not let you submit a caption that is too long' do
        visit '/images'
        click_link 'Add a image'
        fill_in 'Caption', with: 'kfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkf'
        attach_file "Image", "public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg"
        click_button 'Create Image'
        expect(page).not_to have_content 'kfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkfkf'
        expect(page).to have_content 'error'
      end
    end
  end

  context 'viewing images' do

    let!(:test1){ Image.create(caption:'Test', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg')) }

    scenario 'lets a user view a image' do
     visit '/images'
     click_link 'Test'
     expect(page).to have_content 'Test'
     expect(page).to have_css("img[src*='AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg']")
     expect(current_path).to eq "/images/#{test1.id}"
    end

  end

  context 'editing images' do

    before { Image.create(caption:'Test', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg'), id: 1) }
    scenario 'let a user edit a image' do
      visit '/images'
      click_link 'Edit Caption'
      fill_in 'Caption', with: 'Test1'
      click_button 'Update Image'
      click_link 'Test1'
      expect(page).to have_content 'Test1'
      expect(page).to have_css("img[src*='AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg']")
      expect(current_path).to eq '/images/1'
    end
  end

  context 'deleting images' do

    before { Image.create(caption:'Test', image: File.new(Rails.root + 'public/system/images/images/000/000/001/original/AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg')) }

    scenario 'removes a image when a user clicks a delete link' do
      visit '/images'
      click_link 'Delete'
      expect(page).not_to have_content 'Test'
      expect(page).not_to have_css("img[src*='AAEAAQAAAAAAAAjkAAAAJDY3MmYxNjQ2LWJhNjQtNGUzZC05OTNlLTFiNWEyOGE0ZjMxOQ.jpg']")
      expect(page).to have_content 'Image deleted successfully'
    end

  end
end
