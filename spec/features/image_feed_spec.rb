require 'rails_helper'

RSpec.feature "Timeline", type: :feature do
  before do
    sign_up_helper
  end

  context 'no images added yet' do
    scenario 'should show a link to add an image' do
      visit('/')
      expect(page).to have_content('No Images Added Yet')
      expect(page).to have_selector(:link_or_button, 'Upload Image')
    end
  end

  context 'Images have been previously created' do
    before do
      create_image('Test Caption')
    end

    scenario 'User can view image with caption ' do
      visit('/')
      expect(page).to have_content('test@email.com\'s post:')
      expect(page).to have_css("img[src*='image.jpg']")
      expect(page).to have_content('Caption: Test Caption')
    end
  end
end
