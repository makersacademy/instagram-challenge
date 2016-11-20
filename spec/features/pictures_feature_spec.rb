require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet :('
      expect(page).to have_link 'Post a picture'
    end
  end

  context 'pictures have been added' do
    scenario 'displays the pictures' do
      user = create(:user)
      picture = create(:picture)
      visit '/'
      expect(page).to have_content("This is a caption")
      expect(page).to have_css("img[src*='picture']")
      print page.body
    end
  end
end
