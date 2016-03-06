def upload_photo
  visit '/photos'
  click_link 'Upload photo'
  fill_in 'Description', with: 'My photo of a hammer'
  attach_file 'Image', Rails.root + 'spec/features/images/hammericon.png'
  click_button 'Create Photo'
end

def leave_comment
  click_link 'Add comment'
  fill_in 'Comment', with: 'This is my comment'
  click_button 'Leave Comment'
end

def sign_up_helper
  visit ('/')
  click_link('Sign up')
  fill_in('Username',with: 'test')
  fill_in('Email',with: 'test@example.com')
  fill_in('Password',with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_up_with_second_user
  click_link('Sign out')
  visit ('/')
  click_link('Sign up')
  fill_in('Username',with: 'test2')
  fill_in('Email',with: 'test2@example.com')
  fill_in('Password',with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end
