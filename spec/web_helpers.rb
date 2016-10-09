def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('user_email', with: 'james@hello.com')
  fill_in('user_password', with: '123456')
  fill_in('user_password_confirmation', with: '123456')
  click_link('Sign up')
end

def sign_in
  visit('/')
  click_link('Sign in')
  fill_in('user_email', with: 'test@example.com')
  fill_in('user_password', with: '123456')
  click_button('Log in')

end

def add_photo
  visit '/photos/new'

  fill_in('photo_name', with: 'Restaurant')
  fill_in('photo_description', with: 'mmmmmmmm')

  attach_file('photo_image', 'app/assets/images/holla_start_image.jpg')
  click_button('Save Photo')
end
