def upload_image
  visit("/pictures")
  click_link("Add a picture")
  fill_in("Name", with: "Quote 1")
  attach_file("picture[image]", Rails.root + "spec/fixtures/road.png")
  click_button("Upload")
end
