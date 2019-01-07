def upload_cat_picture
  click_link "New post"
  attach_file("Image", Rails.root + "spec/fixtures/files/Cat.jpg")
  fill_in "Description", with: "Cats are great!"
  click_button "Upload"
end
