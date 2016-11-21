def post_a_picture
  visit '/pictures'
  click_link 'Post a picture'
  fill_in 'Title', with: 'My cat is awesome'
  page.attach_file 'picture[image]', './spec/support/cat.jpg'
  click_button 'Post picture'
end

def leave_a_comment(words: 'What a fantastic cat' )
  visit '/pictures'
  click_link 'Comment'
  fill_in 'comment[words]', with: words
  click_button 'Post comment'
end

def sign_up(email: 'test@test.com',
            username: 'Wynndow',
            password: 'password',
            password_confirmation: 'password')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Username', with: username
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password_confirmation
  click_button 'Sign up'
end
