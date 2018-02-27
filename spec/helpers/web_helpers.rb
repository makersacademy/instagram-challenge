def add_post(comment, file )
  visit '/'
  click_link 'New post'
  fill_in 'post[comment]', with: comment
  attach_file 'post[avatar]', file
  click_button 'Create Post'
end

def add_comment(comment)
  visit '/'
  find(:xpath, "//a[contains(@href,'posts/1')]").click
  fill_in 'comment[body]', with: comment
  click_button 'Create Comment'
end

def show_post_to_update
  visit '/'
  find(:xpath, "//a[contains(@href,'posts/1')]").click
  click_link 'Update post'
end

def user_sign_in(email, password)
  visit('/')
  click_link 'Login'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  click_button 'Log in'
end

def user_sign_up(email, password, password_confirmation)
  visit '/users/sign_up'
  fill_in 'user[email]', with: email
  fill_in 'user[password]', with: password
  fill_in 'user[password_confirmation]', with: password_confirmation
  click_button 'Sign up'
end

def login
  user = User.create email: 'test@gmail.com', password: '12345678', password_confirmation: '12345678'
  login_as user
end
