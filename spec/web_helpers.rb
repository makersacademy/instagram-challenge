def sign_up(email,password,username)
  visit('/')
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'name', with: username
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def create_post_with_image(description)
  click_link 'Add a post'
  fill_in 'Description', with: description
  attach_file("Image", Rails.root + "public/images/thumb/hello_world.jpg")
  click_button 'Create Photograph'
end

def create_post_without_image(description)
  click_link 'Add a post'
  fill_in 'Description', with: description
  click_button 'Create Photograph'
end

def leave_comment(comment)
  click_link 'Leave Comment'
  fill_in "Description", with: comment
  click_button 'submit'
end
