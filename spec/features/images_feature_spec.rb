require 'rails_helper'

feature 'Images' do

  context 'when no images have been added' do
    scenario 'the user should be prompt to add photos' do
      visit '/images'
      expect(page).to have_content 'No images available'
      expect(page).to have_link 'Upload Image'
    end
  end

  context 'when uploading images' do
    scenario 'images can be added' do
      add_banana_image
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Banana'
    end
  end

  context 'viewing images' do

    let!(:banana) { Image.create(image: File.open("#{Rails.root}/spec/images/banana.jpeg"), description: "Banana") }

    scenario 'users can view individual images' do
      visit '/images'
      click_link 'Banana'
      expect(page).to have_content 'Banana'
      expect(current_path).to eq "/images/#{banana.id}"
    end
  end

  context 'editing images' do

    let!(:banana) { Image.create(image: File.open("#{Rails.root}/spec/images/banana.jpeg"), description: "Banana") }

    scenario 'users can edit their uploaded image' do
      visit "/images/#{banana.id}"
      click_link 'Edit'
      fill_in 'Description', with: 'Here is a banana'
      click_button 'Update'
      expect(current_path).to eq '/images'
      expect(page).to have_content 'Here is a banana'
    end

  end
  private

  def add_banana_image
    visit '/images'
    click_link 'Upload Image'
    expect(current_path).to eq '/images/new'
    attach_file 'Image', Rails.root.join('spec/images/banana.jpeg')
    fill_in 'Description', with: 'Banana'
    click_button 'Upload Image'
  end

end
