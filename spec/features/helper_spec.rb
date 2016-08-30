
def sign_up(email: 'alice@example.com')
  visit new_user_registration_path
  fill_in 'Email', with: email
  fill_in 'Password', with: '12345678'
  fill_in 'Password confirmation', with: '12345678'
  click_button 'Sign Up'
end

def create_post
  visit '/posts'
  click_link 'Add a post'
  fill_in 'Title', with: 'dog'
  fill_in 'Description', with: 'adorable'
  click_button 'Post'
end

def create_comment(content)
  visit '/posts'
  click_link 'Comment'
  fill_in 'Content', with: content
  click_button 'Post Comment'
end
