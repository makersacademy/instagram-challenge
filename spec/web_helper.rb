def add_photo
  visit('/photos')
  click_link 'Upload a photo'
  page.attach_file('photo_image', Rails.root + 'spec/assets/sunrise.jpg')
  click_button "Upload photo"
end

def click_photo
  find(".photo").click
  visit "photos/#{Photo.first.id}"
end
