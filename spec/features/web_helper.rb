def sign_up(email = 'testuser@email.com')
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'testpassword'
  fill_in 'Password confirmation', with: 'testpassword'
  click_button 'Sign up'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end

def make_a_post
  visit '/'
  click_link 'Post a photo'
  attach_file 'post[image]',
              Rails.root.join('spec', 'fixtures', 'testpattern.jpg')
  fill_in 'Caption', with: 'Test caption'
  click_button 'Post'
end
