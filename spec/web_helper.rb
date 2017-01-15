def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def upload_photo
  visit '/photos'
  click_link 'Add a photo!'
  fill_in 'Description', with: "A fun trip to the beach!"
  click_button 'Upload photo'
end
