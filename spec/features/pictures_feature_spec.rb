require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(image_file_name: 'spec/assets/images/dism.jpg')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_xpath("//img[@alt='Dism']")
      expect(page).not_to have_content('No pictures yet')
    end
  end

  context 'creating pictures' do
    scenario 'prompts user to fill out a form, then displays the new picture' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/dism.jpg'
      click_button 'Create Picture'
      expect(page).to have_xpath("//img[@alt='Dism']")
      expect(current_path).to eq '/pictures'
    end
  end

end