require 'rails_helper'

feature 'pics' do
  context 'no pics have been added' do
    scenario 'should display a prompt to add a pic' do
      visit '/pics'
      expect(page).to have_content 'No pics yet'
      expect(page).to have_link 'New Pic'
    end
  end

  context 'pics have been added' do
    before do
      visit '/pics/new'
      fill_in :Description, with: 'awesome picture'
      page.attach_file('pic_url', Rails.root + 'public/test.png')
      click_button 'Create Pic'
    end
    
    scenario 'should display the pic and description' do
      expect(page).to have_css('img')
      expect(page).to have_content('awesome picture')
    end
  end

end
