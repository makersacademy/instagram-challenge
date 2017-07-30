require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added yet' do
    scenario 'should display a prompt to add a picture' do
      sign_up
      visit '/users/1/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add picture'
    end
  end

  context 'a picture has been added' do
    scenario 'should display the date in which the picture has been uploaded' do
      sign_up
      id = User.all[0].id
      visit "/users/#{id}/pictures/new"
      click_on 'Share'
      expect(page).to have_content 'Posted'
    end
  end

end
