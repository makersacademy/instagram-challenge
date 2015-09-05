# require 'rails_helper'
#
# feature "Photo upload" do
#   before(:each) do
#     @user = create(:user)
#     sign_in(@user)
#     visit photos_path
#     click_link "Upload Photo"
#   end
#
#   scenario "I can upload a photo" do
#     photo = build(:photo_medium)
#
#     attach_file "File", "spec/asset_specs/photos/photo.jpg"
#     # fill_in "Caption", with: photo.caption
#     click_button "Add photo or video"
#
#     expect(page).to have_selector("img")
#   end
