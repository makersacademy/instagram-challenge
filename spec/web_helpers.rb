def upload_photo
  visit '/photos'
  click_link 'Add an photo'
  fill_in "Caption", with: "Galaxy"
  page.attach_file("photo[image]", Rails.root + 'spec/assets/images/night_sky.jpg')
  click_button "Create Photo"
end