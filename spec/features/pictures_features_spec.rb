require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should diplay a prompt to upload a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Upload a picture'
    end
  end

  context 'pictures have been added' do
    before do
      Picture.create(description: 'picture')
    end

    scenario 'display pictures' do
      visit pictures_path
      expect(page).to have_content('picture')
      expect(page).not_to have_content('No pictures yet')
    end
  end
end
