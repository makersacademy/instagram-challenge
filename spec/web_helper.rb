def upload_photo
  sign_up
  visit '/photos'
  click_link 'Upload photo'
  attach_file('photo[image]', "spec/fixtures/files/teckel.jpeg")
  fill_in 'Caption', with: 'cutie'
  click_button 'Upload photo'
end

def sign_up
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
