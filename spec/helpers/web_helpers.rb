def sign_up(username = "testname", email = "newuser@somewhere.com", password  = "123456")
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_out
  click_link 'Sign out'
end

def add_a_picture (file = Rails.root + "spec/fixtures/files/test_picture.jpg")
  click_link 'Upload a picture'
  page.attach_file "picture_image", file
  fill_in 'Description', with: "Test description"
  click_button 'Post'
end
