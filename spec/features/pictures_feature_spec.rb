require 'rails_helper'

feature 'Pictures' do
  context 'no pictures have been added' do
    scenario 'user not signed in visits the main url for the site' do
      visit '/pictures'
      expect(page).to have_content 'No pictures yet'
      expect(page).not_to have_link 'Upload a picture'
    end
  end

  context 'pictures have been added' do
    before do
      visit '/pictures'
      sign_up
      add_a_picture
    end

    context 'adding pictures' do
      scenario 'signed in user can add a picture' do
        expect(page).to have_content 'user1'
        expect(page).to have_selector "img"
        expect(page).not_to have_content 'No pictures yet'
      end

      scenario 'user cannot submit an invalid file type' do
        add_a_picture(Rails.root + "spec/fixtures/files/test_picture.pdf", "wrong")
        expect(page).not_to have_content "wrong"
      end
    end

    context 'viewing pictures' do
      scenario 'allows user to view a picture in more detail' do
        # how to add link to pic successfully?
      end
    end

    context 'deleting pictures' do
      scenario 'allows user to delete their own picture' do
        click_link 'Delete' do
          expect(page).to have_content('Picture deleted successfully')
          expect(current_path).to eq picture_path
        end
      end

      scenario "does not allows user to delete another user's picture" do
        click_link 'Delete' do
          expect(page).to have_content('Picture deleted successfully')
          expect(current_path).to eq picture_path
        end
      end
    end
  end
end
