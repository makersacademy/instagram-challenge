def upload_photo
  sign_up
  click_link 'Upload photo'
  attach_file('photo[image]', "spec/fixtures/files/teckel.jpeg")
  fill_in 'Caption', with: 'cutie'
  click_button 'Shoot'
end

def sign_up(email: 'test@test.com',
            user_name: 'test',
            password: 'password',
            password_confirmation: 'password')
  visit '/'
  first(:link, 'Sign up').click
  fill_in 'User name', with: user_name
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end

def leave_a_comment
  visit '/photos'
  click_link 'Comment'
  fill_in 'Comment', with: 'Meet Coco'
  click_button 'Post comment'
end
