def sign_up
  visit '/'
  click_link 'Login'
  click_link 'Sign up'
  fill_in 'Username', with: 'satoshi'
  fill_in 'Email', with: 'sam@msn.com'
  fill_in 'Password', with: 'capybara'
  fill_in 'Password confirmation', with: 'capybara'
  click_button 'Sign up'
end

def create_post
  click_link 'New Post'
  fill_in 'Caption', with: 'my first post on vanity '
  attach_file('post_image', Rails.root + 'spec/fixtures/apple-touch-icon.png', make_visible: true)
  click_button 'Upload'
end
