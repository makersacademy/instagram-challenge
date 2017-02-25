def sign_up(email: 'test@example.com', password: 'testtest', password_confirmation: 'testtest')
  visit '/'
  click_link 'Sign up' # in the view try to have the test 'Don't have an account?' in front of this
  fill_in 'Email', with: email # in the view try to have a placeholder in the field Email
  fill_in 'Password', with: password
  fill_in 'Password confirmatiohn', with: password_confirmation
  click_button 'Sign up'
end

def upload_photo
  click_link 'Upload a photo'
  fill_in 'Caption', with: 'Cooking!'
  attach_file 'image', Rails.root + 'spec/fixtures/test.jpg'
  click_button 'Upload photo'
end
