require 'rails_helper'

feature 'pictures' do
  context 'no pictures have been added' do
    it 'prompts a user to add a picture' do
      visit '/pictures'
      expect(page).to have_content 'No pictures to display'
      expect(page).to have_link 'Add picture'
    end

    context 'adding a picture' do
      it 'lets the user add a picture that is then displayed' do
        visit '/pictures'
        add_picture
        expect(page).to have_selector("img[src*=test]")
      end

      it 'lets the user add a caption when adding a picture' do
        visit '/pictures'
        add_picture
        expect(page).to have_content("First pic")
      end
    end

    context 'with a picture uploaded' do
      it 'lets the user delete a picture' do
        visit '/pictures'
        add_picture
        click_link 'Delete'
        expect(page).not_to have_selector("img[src*=test]")
      end
    end
  end
end
