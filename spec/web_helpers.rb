def upload_picture
  visit '/pictures/new'
  fill_in "Description", with: "Loch Hope"
  attach_file "picture_image", "spec/asset_specs/photos/photo.jpg"
  click_button "Upload Picture"
end
