def upload_photo
  sign_up
  visit '/photos'
  click_link 'Upload photo'
  attach_file('photo[image]', "spec/fixtures/files/teckel.jpeg")
  fill_in 'Caption', with: 'cutie'
  click_button 'Upload photo'
end

def sign_up(email: 'test@test.com',
            password: 'password',
            password_confirmation: 'password')
  visit '/'
  first(:link, 'Sign up').click
  # click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end
