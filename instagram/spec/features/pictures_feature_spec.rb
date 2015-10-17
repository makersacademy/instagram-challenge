require 'rails_helper'


feature 'pictures' do

  context 'no pictures should be added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures yet"
      expect(page).to have_link "Upload a picture"
    end
  end

  context 'pictures have been uploaded' do
    before do
      Picture.create(caption: "Food")
    end

    scenario 'display pictures' do
      visit '/pictures'
      expect(page).to have_content("Food")
      expect(page).not_to have_content("No pictures yet")
    end
  end

end
