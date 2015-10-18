require 'rails_helper'


feature 'pictures' do

  context 'no pictures should be added' do
    scenario 'should display a prompt to add a picture' do
      visit '/pictures'
      expect(page).to have_content "No pictures yet"
      expect(page).to have_button "Create Picture"
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

  context 'uploading images' do
    scenario 'prompts user to upload an image and write a caption' do
      visit '/pictures'
      upload_picture
      expect(page).to have_content "lunch"
    end
  end

  def upload_picture
    fill_in "picture[caption]", with: "lunch"
    attach_file "picture[image]", 'spec/spec_assets/lunch.png'
    click_button "Create Picture"
  end

end
