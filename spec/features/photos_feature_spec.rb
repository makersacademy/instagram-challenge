require 'rails_helper'

  feature 'photos' do
    xcontext 'no photos have been added' do
      scenario 'should display a prompt to add a photo' do
        visit '/photos'
        expect(page).to have_content 'No photos yet'
        expect(page).to have_link 'Add a photo'
      end
    end
  end

  context 'photos have been added' do
    before do
      Photo.create(title: 'Test Photo')
    end

  xscenario 'display photos' do
    visit '/photos'
    expect(page).to have_content('Test Photo')
    expect(page).not_to have_content('No photos yet!')
  end

  context 'creating photos' do
    scenario 'can create a photo' do
      visit '/photos'
      click_link 'Add photo'
      attach_file('Image', 'spec/files/images/testimage.jpg')
      fill_in 'Title', with: 'Test Photo'
      click_button 'Create Photo'
      expect(page).to have_content('Test Photo')
      expect(page).to have_css("img[src*='testimage.jpg']")
    end
  end
end
