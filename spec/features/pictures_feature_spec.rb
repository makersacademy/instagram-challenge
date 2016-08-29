require 'rails_helper'

feature 'Pictures' do
  context 'no pictures have been added' do
    scenario 'user not signed in visits the main url for the site' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).not_to have_link 'Upload a picture'
    end
  end

  context 'adding a picture' do
    pic = File.new(Rails.root + "spec/fixtures/files/test_picture.jpg")

    before do
      visit '/pictures'
      sign_up
    end

    scenario 'signed in user can add a picture' do
      click_link 'Upload a picture'
      page.attach_file "picture_image", Rails.root + "spec/fixtures/files/test_picture.jpg"
      fill_in 'Description', with: "Test description"
      click_button 'Post'
      expect(page).to have_content 'Test description'
      expect(page).to have_content 'testname'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
end
