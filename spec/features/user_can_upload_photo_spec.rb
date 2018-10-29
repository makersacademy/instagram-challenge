require 'rails_helper'
require 'rake'

RSpec.feature 'Upload Photo', type: :feature do
  before do
    sign_up_helper
  end

  context 'A signed in user' do
    scenario 'can view the page to upload an image' do
      click_on('Upload Image')
      expect(page).to have_content('Upload a new image')
      expect(page).to have_selector('#image_photo')
      expect(page).to have_selector('#image_caption')
    end

    scenario 'can upload an image with a caption' do
      click_on('Upload Image')
      attach_file('image[photo]', File.join(Rails.root + 'spec/fixtures/image.jpg'))
      fill_in 'image_caption', with: 'My second caption'
      click_on('Submit')
      expect(page).to have_content('test@email.com\'s post:')
      expect(page).to have_content('My second caption')
      expect(page).to have_css("img[src*='image.jpg']")
    end
  end
end
