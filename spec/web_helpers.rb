def sign_up(email: 'test@example.com')
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


def upload_photo
  visit '/'
  click_link 'Add a photo'
  fill_in 'photo[caption]', with: 'caption1'
  attach_file 'photo[image]', 'spec/assets/images/test.jpg'
  click_button 'Create Photo'
end 
