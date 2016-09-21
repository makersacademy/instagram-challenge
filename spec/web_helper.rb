def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def sign_up2
  visit '/users/sign_up'
  fill_in 'Email', with: 'test2@example.com'
  fill_in 'Password', with: 'testtest'
  fill_in 'Password confirmation', with: 'testtest'
  click_button 'Sign up'
end

def log_in
  visit '/users/sign_in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'testtest'
  click_button 'Log in'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

def photograph_upload
  sign_up
  visit '/photographs'
  click_link 'Add a photograph'
  attach_file "photograph_image", "spec/spec_assets/2395_What_causes_waves_in_the_ocean.jpg"
  fill_in 'Name', with: 'sea'
  click_button 'Create Photograph'
end
