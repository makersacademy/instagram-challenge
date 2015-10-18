def sign_up_with(email)
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Username', with: 'testuser')
  fill_in('Password', with: 'testttest')
  fill_in('Password confirmation', with: 'testttest')
  click_button('Sign up')
end

def post_photo(caption)
  click_link 'Post a photo'
  page.attach_file 'photo[image]', 'spec/assets/images/burger-king.png'
  fill_in 'Caption', with: caption
  click_button 'Post photo'
end

def leave_comment(comment)
  click_link 'Leave a comment'
  fill_in 'Comment', with: comment
  click_button 'Leave Comment'
end