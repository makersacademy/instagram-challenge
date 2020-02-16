def sign_up
  visit '/'
  click_link 'Sign Up'
  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def new_post
  visit '/posts'
  click_link 'New Post'
  page.attach_file("Image", Rails.root + 'app/assets/images/cat.png')
  fill_in 'Caption', with: 'Hello, world!'
  click_button 'Submit'
end