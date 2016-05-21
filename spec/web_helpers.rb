def upload_image
  visit '/images'
  click_link 'Add an image'
  fill_in "Caption", with: "Galaxy"
  page.attach_file("image", Rails.root + 'http://static3.businessinsider.com/image/55b675ab2acae7c7018ba34e-1200/milky-way-galaxy.jpg')
  click_button "Post"
end