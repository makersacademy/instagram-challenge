require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content('No pictures yet')
      expect(page).to have_link('Add a picture')
    end
  end

  context 'pictures have been added' do
    scenario 'display pictures' do
      visit '/pictures'
      click_link('Add a picture')
      page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
      fill_in 'Name', with: 'respect!'
      click_button 'Create Picture'
      expect(page).to have_content('respect!')
      expect(page).to have_selector('img')
    end
  end

  context 'viewing pictures' do
    scenario 'lets a user view a picture' do
      visit '/pictures'
      click_link('Add a picture')
      page.attach_file 'picture[image]', 'spec/assets/images/respect.jpg'
      fill_in 'Name', with: 'respect!'
      click_button 'Create Picture'
      click_link('respect!')
      expect(page).to have_content('respect!')
      expect(current_path).to eq("/pictures/#{respect!.id}")
    end
  end

end
