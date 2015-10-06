require 'rails_helper'

feature 'photos' do

  context 'no photos added' do
    scenario 'should display a Upload Photo button' do
      user = build(:user)
      sign_up(user)
      expect(page).to have_link 'Upload Photo'
      expect(page).to have_content 'No photos yet!'
    end
  end

  context 'adding photos' do

    before do
      user = create(:user)
      sign_in(user)
      visit photos_path
    end

    scenario "I should see the form to upload a photo" do
      click_link "Upload Photo"
      expect(current_path).to eq(new_photo_path)
      expect(page).to have_content('Photo')
    end

    scenario "I can upload a photo" do
      click_link "Upload Photo"
      attach_file("photo[picture]", "spec/images/dimensions.png")
      click_button 'Create Photo'
      expect(page).to have_css('img')
      expect(page).to have_content('test2@test.com')
    end

    # scenario "I cannot upload without attaching a file" do
    #   expect(page).to have_content 'No photos yet!'
    #   click_link "Upload Photo"
    #   click_button 'Create Photo'
    #   expect(page).not_to have_css('img')
    #   expect('/photos/new').to have_content('You need to provide a photo file')
    #
    # end
  end
end
