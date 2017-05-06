def sign_up(email)
  click_link 'Sign up'
  fill_in 'Username', with: 'pixel'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'purrpurr'
  fill_in 'Password confirmation', with: 'purrpurr'
  click_button 'Sign up'
end

def create_post
  click_link('Add a post')
  fill_in 'Description', with: 'Nice'
  attach_file('post_image', Rails.root + "spec/fixtures/cat.png")
  click_button('Create Post')
end
