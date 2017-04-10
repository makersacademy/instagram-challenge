def signup
  visit '/users/sign_up'
  fill_in 'user_username', with: 'JohnSmith'
  fill_in 'user_email', with: 'test@example.com'
  fill_in 'user_password', with: '123123'
  fill_in 'user_password_confirmation', with: '123123'
  click_button 'Sign up'
end

def add_post
  click_link 'Add Post'
  page.attach_file('post_image', File.absolute_path('app/assets/images/placeholder.png'))
  fill_in 'post_caption', with: 'Some caption for the image goes here.'
  click_button 'submit'
end
