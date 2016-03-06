def add_picture
  click_link 'Add picture'
  attach_file 'picture_image', Rails.root + 'spec/features/test.jpg'
  fill_in "Caption", with: 'First pic'
  click_button 'Upload picture'
end

def sign_up(email='test@email.com', password='P4ssword')
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def sign_in
  click_link 'Sign in'
  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'P4ssword'
end
