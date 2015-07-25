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
    scenario 'succeeds when a title is entered' do
      visit '/pictures'
      click_link 'Click here to add a picture!'
      fill_in 'Title', with: 'PFC'
      attach_file "Image", 'spec/features/Pompey.jpg'
      click_button 'Upload picture'
      expect(page).to have_css("img[src*='Pompey.jpg']")
    end

    scenario 'fails without a title' do
    visit '/pictures'
    click_link 'Click here to add a picture!'
    attach_file "Image", 'spec/features/Pompey.jpg'
    click_button 'Upload picture'
    expect(page).to have_content 'error'
    end

  end
end
