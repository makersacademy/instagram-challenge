def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('First name', with: 'Testy')
  fill_in('Last name', with: 'Testerson')
  fill_in('Username', with: 'testy1')
  fill_in('Email', with: 'testy@test.com')
  fill_in('Password', with: 'Password')
  fill_in('Password confirmation', with: 'Password')
  click_button('Sign up')
end

def create_post
  click_button('New Post')
  attach_file('image', 'spec/files/images/llama.jpeg')
  fill_in('caption', with: 'Llama')
  click_button('Create Post')
end
