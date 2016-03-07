def sign_in(email, password)
  visit '/'
  click_button 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end

def post_picture(description='My first picture!')
  visit '/pictures'
  click_link 'Post a picture'
  fill_in 'Description', with: description
  page.attach_file('Image', Rails.root + 'spec/factories/test.jpg')
  click_button 'Post'
end
