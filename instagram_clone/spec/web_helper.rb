
def create_post
  visit '/posts'
  click_link 'New post', match: :first
  fill_in 'Title', with: 'First post'
  fill_in 'Description', with: 'great'
  page.attach_file("post_image", Rails.root + 'app/assets/images/shadow.JPG')
  click_button 'Create Post'
end

def user_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@test.com'
  fill_in 'Password', with: 'secret'
  fill_in 'Password confirmation', with: 'secret'
  click_button 'Sign up'
end

def second_user_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'luke@test.com'
  fill_in 'Password', with: 'secret'
  fill_in 'Password confirmation', with: 'secret'
  click_button 'Sign up'
end

def user_sign_out
  visit '/'
  click_link 'Sign out'
end
