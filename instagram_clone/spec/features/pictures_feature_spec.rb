require 'rails_helper'

feature 'Pictures' do

  context 'Website when initialized' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'when picture has been added in the database' do

    def create_a_picture file_path = "spec/fixtures/image3.png"
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      attach_file "picture_image", file_path
      click_button 'Create Picture'
    end

    scenario 'image of picture is displayed' do
      visit '/pictures'
      create_a_picture
      #make capybara test for image on page
      expect(page).to have_content('Holiday')
      expect(page).not_to have_content('No pictures yet')
    end

    scenario 'title of picture is displayed' do
      visit '/pictures'
      click_link 'Add a picture'
      fill_in 'Title', with: 'Holiday'
      click_button 'Create Picture'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'viewing pictures' do

    let!(:holiday){Picture.create(title:'Holiday')}

    scenario 'let a user view the enlarged picture' do
      visit '/pictures'
      click_link 'Holiday'
      expect(page).to have_content 'Holiday'
      expect(current_path).to eq "/pictures/#{holiday.id}"
    end
  end

  context 'editing pictures' do

    before { Picture.create title: 'Holiday' }

    scenario 'user can change the title of a picture' do
      visit '/pictures'
      click_link 'Edit Holiday'
      fill_in 'Title', with: 'My Holiday'
      click_button 'Update Picture'
      expect(page).to have_content 'My Holiday'
      expect(current_path).to eq '/pictures'

    end

  end

end
