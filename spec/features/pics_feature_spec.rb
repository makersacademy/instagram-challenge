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

    scenario 'picture can be edited' do
      visit '/pics'
      click_link 'Edit'
      expect(page).to have_css('form.edit_pic')
      fill_in :Description, with: 'a very cool picture'
      click_button 'Update Pic'
      expect(page).not_to have_content('awesome picture')
      expect(page).to have_content('a very cool picture')
    end

    scenario 'picture can be deleted' do
      visit '/pics'
      click_link 'Delete'
      expect(page).not_to have_content('awesome picture')
      expect(page).not_to have_css('img')
    end
  end

end
