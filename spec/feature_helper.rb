def sign_up(email='new_user@example.com',password='password')
  visit '/'
  click_on 'Login'
  click_on 'Sign up'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password
  click_button 'Sign up'
end

def sign_out
  click_on 'Logout'
end

def create_post(image_url = "spec/files/images/castle.jpg", description = 'A lovely castle #wales')
  visit '/'
  click_link 'New Post'
  attach_file('upl-post-img', image_url)
  fill_in 'post-desc', with: description
  click_button 'Create Post'
end