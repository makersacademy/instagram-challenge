module Helpers
  def sign_in
    User.create(first_name: 'first name', last_name: 'last name', username: 'username', email: 'user@email.com', password: 'password')
    visit '/'
    click_on 'Sign in'
    fill_in 'user[username]', with: 'username'
    fill_in 'user[password]', with: 'password'
    click_on 'Log in'
  end

  def create_post
    fill_in 'post[description]', with: 'password'
    attach_file('post[image]', 'spec/files/dog1.jpg')
    click_on 'Create Post'
  end
end