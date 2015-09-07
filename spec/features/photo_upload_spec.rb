require 'rails_helper'
#
feature "Photo upload" do
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
#
  scenario "I can upload a photo" do
    attach_file 'Picture', Rails.root.join('spec/images/dimensions.png')
    expect(page).to have_selector('img')
  end
end

#     photo = build(:photo_medium)
#
#     attach_file "File", "spec/asset_specs/photos/photo.jpg"
#     # fill_in "Caption", with: photo.caption
#     click_button "Add photo or video"
#
#     expect(page).to have_selector("img")
#   end
