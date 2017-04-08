def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def add_photo
  visit('/')
  click_link 'Post a photo'
  fill_in 'Caption', with: 'Sunny :)'
  fill_in 'Location', with: 'Hyde Park'
  click_button 'Post photo'
end
