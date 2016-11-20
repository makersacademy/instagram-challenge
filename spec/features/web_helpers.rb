def upload_a_photo
  visit '/photos'
  click_link 'Post a photo'
  attach_file "Image", Rails.root + 'spec/features/test_images/chase.jpg'
  click_button 'Create Photo'
end

def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  click_button('Sign in')
end

def sign_in_as_diff_user
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'him@example.com')
  fill_in('Password', with: 'mehmehmeh')
  fill_in('Password confirmation', with: 'mehmehmeh')
  click_button('Sign up')
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_out
  visit('/')
  click_link('Sign out')
end
