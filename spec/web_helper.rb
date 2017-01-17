def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up2
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

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
