def sign_up(email)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end

def sign_in(email)
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  click_button 'Log in'
end

def add_picture(description)
  visit '/'
  click_link 'Add a picture'
  # click_link 'picture_image'
  fill_in 'picture_description', with: description
  click_button 'Create Picture'
end