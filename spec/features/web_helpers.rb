def add_picture
  click_link 'Add picture'
  attach_file 'picture_image', Rails.root + 'spec/features/test.jpg'
  fill_in "Caption", with: 'First pic'
  click_button 'Upload picture'
end

def sign_up
  click_link 'Sign up'
  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'P4ssword'
  fill_in 'Password confirmation', with: 'P4ssword'
  click_button 'Sign up'
end

def sign_in
  click_link 'Sign in'
  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'P4ssword'
end
