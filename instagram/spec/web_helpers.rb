def sign_up
  visit '/users/sign_up'
  fill_in('Email', :with => 'example@email.com')
  fill_in('Password', :with => 'password')
  fill_in('Password confirmation', :with => 'password')
  click_button 'Sign up'
end

def login
  visit '/'
  click_link 'Login'
  fill_in('Email', :with => 'example@email.com')
  fill_in('Password', :with => 'password')
  click_button 'Log in'
end

def change_password
  click_link 'Edit profile'
  fill_in('Email', :with => 'example@email.com')
  fill_in('Password', :with => 'newpassword')
  fill_in('Password confirmation', :with => 'newpassword')
  fill_in('Current password', :with => 'password')
  click_button 'Update'
end

def upload_photo
  visit '/photos'
  click_link 'New Photo'
  page.attach_file('photo_image', './app/assets/images/instagram.jpg')
  click_button 'Create Photo'
end
