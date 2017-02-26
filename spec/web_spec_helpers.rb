def add_comment(text)
  click_link 'Leave comment'
  fill_in 'Thoughts', with: text
  click_button 'Comment'
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Username', with: 'testtest')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
  @user = User.find_by_email('test@example.com')
end
