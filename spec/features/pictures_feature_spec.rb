require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content 'No pictures added yet'
      expect(page).to have_content 'Upload a picture'
    end
  end

  context 'pictures have been added' do
    before do
      upload_image
    end

    let!(:testPic){ Picture.first }

    scenario 'display all added pictures' do
      visit '/'
      expect(page).to have_content 'Test description'
      expect(page).to have_css "img[src*='Test.JPG']"
      expect(page).not_to have_content 'No pictures added yet'
    end

    scenario 'user can view an uploaded image' do
      visit '/'
      click_link 'Test description'
      expect(page).to have_content 'Test description'
      expect(current_path).to eq "/pictures/#{testPic.id}"
    end
  end

  context 'uploading pictures' do

    scenario 'prompts user to fill out a form, then displays the new picture' do
      upload_image
      expect(page).to have_content 'Test description'
      expect(page).to have_css "img[src*='Test.JPG']"
      expect(current_path).to eq '/pictures'
    end

    scenario 'requires a user to include an image to create a post' do
      visit '/'
      click_link 'Upload a picture'
      fill_in 'Description', with: "test description"
      click_button 'Upload Picture'
      expect(page).to have_content "You need to include an image file"
    end
  end

  context "editing picture details" do

    scenario "allows a user to edit the description of a picture" do
      upload_image
      visit '/'
      click_link "Edit image description"
      fill_in 'Description', with: "A different description"
      click_button "Edit description"
      expect(page).to have_content "A different description"
      expect(page).not_to have_content "Test description"
      expect(current_path).to eq '/pictures'
    end
  end

end
