def add_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Caption', with: 'Beautiful day'
  page.attach_file('post[image]', Rails.root + 'spec/fixtures/snow_and_sun.jpg')
  click_button 'Post'
end

def sign_up
  visit '/posts'
  click_link 'Sign up'
  fill_in 'Email', with: 'user@user.com'
  fill_in 'Password', with: 'password123'
  fill_in 'Password confirmation', with: 'password123'
  click_button 'Sign up'
end

def sign_up2
  visit '/posts'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'donkey'
  fill_in 'Password confirmation', with: 'donkey'
  click_button 'Sign up'
end

def add_comment
  visit '/posts'
  click_link 'image'
  click_link 'Comment'
  fill_in 'Comments', with: 'Nice!'
  click_button 'Comment'
end
