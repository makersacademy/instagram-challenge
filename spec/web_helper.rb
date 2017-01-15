def add_photo
  click_link('Post a Photo')
  fill_in 'Caption', with: 'Travelling'
  attach_file("photo_image", Rails.root + "spec/fixtures/test.jpg")
  click_button('Create Photo')
end

def add_second_photo
  visit('/photos/new')
  fill_in 'Caption', with: 'Another photo'
  attach_file("photo_image", Rails.root + "spec/fixtures/another.jpg")
  click_button('Create Photo')
end

def sign_up
  visit('/')
  click_link('Register')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def add_comment
  photo_id = Photo.first.id
  fill_in "comment_content", with: "nice"
  find("comment_content").native.send_keys :enter
  # click_button 'submit'
end

def sign_out
  click_link("Logout")
end

def another_sign_up
  visit('/')
  click_link('Register')
  fill_in('Email', with: 'test2@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
