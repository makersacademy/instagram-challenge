require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'it states that there are no pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add a picture'
    end
  end

  context 'a picture has been added' do
    before do
      @pic = create(:picture)
    end

    scenario 'it does not state that there are no pictures' do
      visit '/pictures'
      expect(page).not_to have_content 'No pictures yet'
    end

    xscenario 'test' do
      visit '/pictures'
      click_link picture_path(@pic)
      expect(page).to have_content "Delete this page"
    end
  end
end
