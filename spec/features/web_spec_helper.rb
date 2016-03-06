def add_photo
  visit '/photos'
  click_link 'Add a photo'
  attach_file 'Image', Rails.root.join('spec','features','img.jpg')
  click_button 'Create Photo'
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
