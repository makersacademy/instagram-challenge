def sign_up(email = 'test@test.com', password = 'password',
           password_confirmation = 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def create_post
  visit '/'
  sign_up
  click_link 'New Post'
  attach_file 'Image', "spec/files/images/canada.jpg"
  fill_in 'Caption', with: 'Snowboarding in Canada #winter'
  click_button 'Create Post'
end
