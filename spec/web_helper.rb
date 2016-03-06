def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@testemail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end 

def sign_up_2
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test2@testemail.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end 

def post_photo
  visit '/'
  sign_up 
  click_link 'Upload A Photo'
  attach_file "photo[image]", "spec/asset_specs/photos/Elephant.jpg"
  fill_in 'Description', with: 'test image of elephant'
  click_button 'Create Photo'
end 

