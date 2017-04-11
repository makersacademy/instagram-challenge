def sign_up(email = "test@test.com", password = "password")
  visit '/'
  click_link 'Sign up'
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  click_button "Sign up"
end

def add_image
  click_link 'Add picture'
  page.attach_file("picture_image", Rails.root + 'app/assets/images/link_clingy_korok.jpg')
  click_button 'Create Picture'
end
