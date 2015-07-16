def sign_up(email)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign up'
end

def sign_in(email)
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  click_button 'Log in'
end

def add_picture
  click_link 'Add a picture'
  attach_file 'picture_image', 'spec/betty.jpg'
  fill_in 'Title', with: 'Betty'
  click_button 'Create Picture'
end

def add_picture2
  click_link 'Add a picture'
  attach_file 'picture_image', 'spec/me.jpg'
  fill_in 'Title', with: 'Daryl'
  click_button 'Create Picture'
end

def add_comment(text)
  click_link 'Comment'
  fill_in 'comment_description', with: text
  click_button 'Create Comment'
end