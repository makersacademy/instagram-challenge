def create_new_image()
  # Image.create()

  visit '/images'
  click_link 'Add an image'
  attach_file('image_image', "public/img/original/missing.png")
  click_button 'Create Image'
  expect(current_path).to eq '/images'
end

def sign_up(email='test@example.com', username="test",
            password='testtest', cpassword='testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Username', with: username)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: cpassword)
  click_button('Sign up')
end

def like_image()
  visit '/images'
  click_link 'Like'
end
