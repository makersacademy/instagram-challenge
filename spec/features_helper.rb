def sign_up_for_an_account(email: 'user@example.com', password: 'password')
  visit '/users/sign_up'

  fill_in 'user_email', with: email
  fill_in 'user_password', with: password
  fill_in 'user_password_confirmation', with: password

  click_button 'Sign up'
end

def log_out
  click_link 'Sign out'
end

def post_an_image
  visit '/posts/new'
  attach_file 'post_image', './spec/images/mage.jpg'
  click_button 'Submit Post'
end