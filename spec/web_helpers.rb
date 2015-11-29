def sign_up(email, password)
  visit '/'
  click_link('Sign up')
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  click_button('Sign up')
end

def sign_out
  click_link('Sign out')
end

def upload_image(comment, image=false)
  visit '/'
  click_link 'Upload a new image'
  fill_in :upload_description, with: comment
  attach_file('upload[image]', 'test.jpeg') if image
  click_button('Upload')
end

def add_comment(comment)
  visit '/'
  click_link('Add comment')
  fill_in :comment_comment, with: comment
  click_button "Add comment"
end