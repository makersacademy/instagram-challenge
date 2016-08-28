def make_a_post
  click_link 'post'
  fill_in 'Caption', with: 'Should I take him to the doctor?'
  page.attach_file "post_image", Rails.root + 'spec/fixtures/test.png'
  click_button 'post it'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.co.uk'
  fill_in 'Password', with: 'secret1234'
  fill_in 'Password confirmation', with: 'secret1234'
  click_button 'Sign up'
end

def sign_in(email,password)
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Log in'
end
