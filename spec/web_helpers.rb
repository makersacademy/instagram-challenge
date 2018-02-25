def create_post
  Post.create(description: 'Amazing day', user_id: 1)
  visit '/posts'
end

def user_login(email)
  visit '/'
  user = User.create email: email, password: 'password', password_confirmation: 'password'
  login_as user
end

def create_comment
  Comment.create(body: 'Great', user_id: 1)
  visit '/posts/1'

end
