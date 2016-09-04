require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'it states that there are no pictures' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
    end
  end

  context 'adding a picture' do
    before do
      @picture = create(:picture)
    end

    scenario 'it does not state that there are no pictures' do
      visit '/pictures'
      expect(page).not_to have_content 'No pictures yet'
    end

    scenario 'a page is created for each picture' do
      visit picture_path(@picture)
      expect(page.status_code).to be 200
    end
  end

  xcontext 'deleting a picture' do
    before do
      @picture = create(:picture)
    end

    scenario "the picture's page is deleted" do
      visit picture_path(@picture)
      click_link 'Delete this picture'
      visit picture_path(@picture)
      expect(page.status_code).to be 200
    end
  end
end
