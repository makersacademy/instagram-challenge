def log_in_test_user
  User.create(email: 'test@test.com', password: '123456')
  visit '/'
  fill_in ('user_email'), with: 'test@test.com'
  fill_in ('user_password'), with: '123456'
  click_button ('Log in')
end

def log_in_test_user_2
  User.create(email: 'test2@test2.com', password: '123456')
  visit '/'
  fill_in ('user_email'), with: 'test2@test2.com'
  fill_in ('user_password'), with: '123456'
  click_button ('Log in')
end
