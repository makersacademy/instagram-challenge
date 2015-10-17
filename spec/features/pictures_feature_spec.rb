require 'rails_helper'

feature 'pictures' do

  context 'no pictures have been uploaded' do

    scenario 'should have link to upload a picture' do
      visit '/pictures'
      expect(page).to have_content "No one has uploaded any pictures yet!"
      expect(page).to have_link "Upload a picture"
    end

  end

  context 'pictures has been uploaded' do

    before do
      Picture.create(caption: 'coding at home')
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content('coding at home')
      expect(page).not_to have_content('No one has uploaded any pictures yet!')
    end

  end

end
