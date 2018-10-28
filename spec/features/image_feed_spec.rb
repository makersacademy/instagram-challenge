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

  context 'creating an image' do
    before do
      create_image('Test Caption')
    end

    scenario 'User can view image caption ' do
      visit('/')
      expect(page).to have_content('Test Caption')
    end

  end
end
