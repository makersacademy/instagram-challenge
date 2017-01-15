def sign_up(email: 'test@example.com', password: 'testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def upload_picture
  click_link 'Upload a picture'
  fill_in 'Caption', with: 'Test caption'
  fill_in 'Location', with: 'London'
  page.attach_file("picture_image", Rails.root + "spec/test-image.jpg")
  click_button 'Create Picture'
end
