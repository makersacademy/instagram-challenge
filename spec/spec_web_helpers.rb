def sign_up (email: 'test@example.com',
            password: 'testtest',
            confirm: 'testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: confirm)
  click_button('Sign up')
end

def sign_in (email: 'test@example.com',
            password: 'testtest')
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Log in')
end

def sign_out
  click_button('Sign out')
end

def add_photo
  visit '/photos'
  click_link 'Add a photo'
  fill_in 'File', with: 'Test'
  attach_file('Image', '/Users/jeremybarrass/Pictures/Space!/AI_dream2.jpg')
  click_button 'Create Photo'
end
