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

    before {Picture.create(image_file_name: 'spec/assets/images/dism.jpg')}

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
    scenario 'the new picture appears above an old one' do
      visit '/pictures'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/dism.jpg'
      click_button 'Create Picture'
      click_link 'Add a picture'
      attach_file 'picture[image]', 'spec/assets/images/choc.jpg'
      click_button 'Create Picture'
      expect(page.body.index('Choc')).to be < (page.body.index('Dism'))
    end
  end

  context 'deleting pictures' do

    before {Picture.create(image_file_name: 'spec/assets/images/dism.jpg')}

    scenario 'removes a picture when a user clicks a delete link' do
      visit '/pictures'
      click_link 'Delete'
      expect(page).not_to have_xpath("//img[@alt='Dism']")
      expect(page).to have_content 'Picture deleted successfully'
    end

end

end