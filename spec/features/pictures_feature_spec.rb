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
    before do
      visit '/pictures'
      sign_up
      add_a_picture
    end

    scenario 'signed in user can add a picture' do
      expect(page).to have_content 'testname'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
end
