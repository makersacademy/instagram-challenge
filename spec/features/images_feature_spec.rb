require 'rails_helper'

feature 'images' do
  context 'no images have been added' do
    scenario 'should display a prompt to add an image' do
      visit '/images'
      expect(page).to have_content 'No Images Yet'
      expect(page).to have_link 'Add an image'
    end
  end

  context 'images have been added' do
    before do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Name', with: 'Aaaw'
      attach_file('Image', '/Users/user/Pictures/CapybaraDuckTortoise.jpg')
      click_button 'Create Image'
    end

    scenario 'should display all images' do
      visit '/images'
      expect(page).not_to have_content 'No Images Yet'
      expect(page).to have_xpath("//img[contains(@src, 'CapybaraDuckTortoise.jpg')]")
    end

    scenario 'can view an image' do
      visit '/images'
      image = find(:xpath, "//a/img[contains(@src, 'CapybaraDuckTortoise.jpg')]/..")
      image.click
      expect(page).to have_xpath("//img[contains(@src, '/original/CapybaraDuckTortoise.jpg')]")
    end

    scenario 'can delete an image' do
      visit '/images'
      image = find(:xpath, "//a/img[contains(@src, 'CapybaraDuckTortoise.jpg')]/..")
      image.click
      click_link('Delete Image')
      expect(page).not_to have_xpath("//img[contains(@src, 'CapybaraDuckTortoise.jpg')]")
      expect(page).to have_content "Image 'Aaaw' deleted successfully"
    end
  end

  context 'adding an image' do
    scenario 'fill out a form and then display new image' do
      visit '/images'
      click_link 'Add an image'
      fill_in 'Name', with: 'Capybara Family'
      fill_in 'Description', with: 'Aren\'t they cute?'
      attach_file('Image', '/Users/user/Pictures/CapybaraFamily.jpg')
      click_button 'Create Image'
      expect(page).to have_xpath("//img[contains(@src, 'CapybaraFamily.jpg')]")
      expect(current_path).to eq '/images'
    end

    scenario 'can\'t create image if one hasn\'t been uploaded' do
      visit '/images'
      click_link 'Add an image'
      click_button 'Create Image'
      expect(page).to have_content 'error'
    end
  end
end