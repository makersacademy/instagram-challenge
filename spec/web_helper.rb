def create_user
  User.create(email: 'test@test.com', password: 'password', id: 1)
end

def create_user_two
  User.create(email: 'test2@test.com', password: 'password', id: 2)
end

def sign_in(email= 'test@test.com', password= 'password')
  visit('/')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  click_button('Log in')
end

def create_post
  Post.create(description: 'My lovely photo', user_id: 1, id: 1)
end
