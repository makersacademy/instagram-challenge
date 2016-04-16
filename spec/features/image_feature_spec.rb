require 'rails_helper'

feature 'image' do
  context 'no images added yet' do
    scenario 'should have button to add images' do
      visit '/images'
      expect(page).to have_content('No images added yet')
      expect(page).to have_link('Upload new image')
    end
  end

  scenario 'user can add a image' do
    visit '/images'
    click_link('Upload new image')
    fill_in ('Name'), with: 'Test image'
    fill_in ('Description'), with: 'Test description'
    attach_file 'image[image]', Rails.root + 'spec/support/uploads/test_image.jpg'
    click_link('Upload image')
    expect(page).to have_path '/images'
    expect(page).not_to have_content 'No images added yet'
    expect(page).to have_xpath("//img[contains(@src, 'test_image.jpg')]")
  end
end
