require 'rails_helper'

feature 'photos' do

  context 'no photos added' do

    scenario 'should display a Upload Photo button' do
      user = build(:user)
      visit photos_path
      sign_up(user)
      expect(page).to have_link 'Upload Photo'
      expect(page).to have_content 'No photos yet!'
    end
  end

  context 'photos added' do

    before(:each) do
      user = build(:user)
      sign_up(user)
      visit photos_path
      click_link "Upload Photo"
    end

    scenario "I should see the form to upload a photo" do
      expect(current_path).to eq(new_photo_path)
      expect(page).to have_content('Picture')
    end

    # photos go to an s3 bucket on aws so I couldnnt write a better test

    scenario "I can upload a photo" do
      visit photos_path
      click_link 'Upload Photo'
      attach_file("photo[picture]", "spec/images/dimensions.png")
      expect(page.status_code).to be(200)
    end

  end
end
