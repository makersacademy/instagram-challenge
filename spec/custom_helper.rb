def sign_up_and_in
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'password1'
  fill_in 'Password confirmation', with: 'password1'
  click_button 'Sign up'
end

def create_post(image)
  visit '/'
  click_link 'Add an image'
  attach_file 'Image', "spec/support/#{image}"
  click_button 'Post Image'
end
