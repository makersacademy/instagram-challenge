require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet!'
      expect(page).to have_link 'Click here to add a picture!'
    end
  end

  context 'uploading a picture' do
    scenario 'without a caption' do
      visit '/pictures'
      expect(page).to have_css("img[src*='Pompey.jpg']")
    end
  end
end
