def sign_up
  visit '/users/sign_up'
  fill_in :user_email, with: 'test@email.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Sign up'
end

def add_post
  sign_up
  click_button 'New'
  fill_in :post_title, with: "This is just a test title"
  fill_in :post_contents, with: "And this is a test comment"
  attach_file('post_picture', File.absolute_path('./spec/claude.png'))
  click_on :commit
end

def add_second_post
  click_button 'New'
  fill_in :post_title, with: "This is just a second test title"
  fill_in :post_contents, with: "And this is a second test comment"
  attach_file('post_picture', File.absolute_path('./spec/claude.png'))
  click_on :commit
end

def add_comment
  fill_in :comment_contents, with: "Claude looks so noble in that image"
  click_on :commit
end
