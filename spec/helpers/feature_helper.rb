def add_picture(path)
  visit '/pictures'
  click_link 'Add a picture'
  attach_file "picture_image", path
  click_button "Create Picture"
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
