def sign_up(name, email, password)
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: name
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def add_picture
  click_link 'Add a picture'
  page.attach_file('picture_image', Rails.root + 'spec/assets/test_picture.jpg')
  click_button 'Upload picture'
end
