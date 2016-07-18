def sign_up(email = 'test@test.com')
  visit '/'
  click_link 'Sign Up'
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign Up')
end

def sign_in
  visit '/'
  click_link 'Login'
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'testtest')
  click_button('Login')
end

def add_post(caption = 'COFFEE')
  click_link 'New Post'
  attach_file 'Image', "app/assets/images/coffee.jpg"
  fill_in 'Caption', with: caption
  click_button 'Create Post'
end
