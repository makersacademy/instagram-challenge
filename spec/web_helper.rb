def create_user
  User.create(email: 'test@test.com', password: 'password', id: 1)
end

def sign_in
  visit('/')
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: 'password')
  click_button('Log in')
end

def create_post
  Post.create(description: 'My lovely photo', user_id: 1, id: 1)
end
