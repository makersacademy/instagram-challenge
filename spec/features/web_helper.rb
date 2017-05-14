def sign_up(email)
  visit posts_path
  click_link 'Sign up'
  fill_in 'Username', with: 'pixel'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'purrpurr'
  fill_in 'Password confirmation', with: 'purrpurr'
  click_button 'Sign up'
  @signed_up_user = User.find_by_email(email)
end

def create_post
  click_link('Add a post')
  fill_in 'Description', with: 'Nice'
  attach_file('post_image', Rails.root + "spec/fixtures/cat.png")
  click_button('Create Post')
end

def leave_comment(text)
  click_link('Comment')
  fill_in('Comment', with: text)
  click_button('Leave comment')
end
