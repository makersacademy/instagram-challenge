def sign_up(email: 'test@example.com', password: 'testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def sign_in(email: 'test@example.com', password: 'testtest')
  visit('/')
  click_link('Sign in')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Log in')
end

def upload_post
  visit('/')
  click_link('Create a post')
  attach_file("post_image", "spec/sunset.jpg")
  fill_in('Description', with: 'Beautiful view')
  click_button('Create Post')
end

def upload_post_without_image
  visit('/')
  click_link('Create a post')
  fill_in('Description', with: 'Beautiful view')
  click_button('Create Post')
end
