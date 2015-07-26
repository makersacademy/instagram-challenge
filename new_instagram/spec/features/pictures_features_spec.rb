require 'rails_helper'

feature 'pictures' do
  context 'no pictures added' do
    scenario 'should display a promp to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).to have_link 'Add new picture'
    end
  end
  context "Some pictures added" do
     before do
    Picture.create(title: me,)
    end
    scenario "display pictures" do
      visit '/pictures'
      expect(page).to have_content 'me'
      expect(page).not_to have_content 'No pictures yet'
    end
  end
end
