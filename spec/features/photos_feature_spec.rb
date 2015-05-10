require 'rails_helper'

feature 'photos' do
  context 'no photos have been added' do
    before do
      visit '/users/sign_up'
      fill_in 'Username', with: 'TheMagicalInternationalWoodlouse'
      fill_in 'Email', with: 'fake@fakeemail.com'
      fill_in 'Password', with: 'secretone'
      fill_in 'Password confirmation', with: 'secretone'
      click_button 'Sign up'
    end
    scenario 'should display a prompt to upload a photo' do
      visit '/photos'
      expect(page).to have_content 'No photos yet'
      expect(page).to have_link 'Add a photo'
    end
    scenario 'add a photo' do
      visit '/photos'
      click_link 'Add a photo'
      fill_in 'Description', with: "Nando's 4 lyf"
      attach_file "photo[image]", 'spec/fixtures/files/images/MeAndMe.png'
      click_button 'Submit Photo'
      expect(page).to have_content 'Description: Nando\'s 4 lyf'
      expect(page).to have_css('img', "MeAndMe.png")
      expect(page).to have_content 'By TheMagicalInternationalWoodlouse'
    end
  end
end