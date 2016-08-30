def post_photo
  visit '/'
  click_link 'Add Photo'
  attach_file("photo_image", Rails.root + 'spec/images/selfie.jpg')
  fill_in 'Description', with: 'Selfie'
  click_button 'Post Photo'
end

def sign_up
  visit('/')
  click_link('Sign Up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign Up')
end
