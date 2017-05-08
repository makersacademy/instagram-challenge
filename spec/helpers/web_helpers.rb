def sign_up(username: 'Rick_Never_Gives_Up', email: 'test@test.com', password: 123456)
  visit '/'
  click_link 'Sign up'
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def upload_photo
  visit '/'
  click_link 'Add a photo'
  fill_in 'Caption', with: 'Avocado and Scrambled eggs #Living'
  fill_in 'Location', with: 'Somewhere pretentious'
  attach_file('choose-file', Rails.root + "spec/fixtures/rick-astley.jpg")
  click_button 'Upload Photo'
end

def leave_comment(text)
  fill_in "Content", with: text
  click_button 'Comment'
end
