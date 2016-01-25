def sign_in
  User.create(user_name: "tester", email: "test@live.com", password: "password", password_confirmation: "password")
  visit '/'
  click_link 'Login'
  fill_in "Email", with: "test@live.com"
  fill_in "Password", with: "password"
  click_button 'Log in'
end

def post
  
  click_link 'New Post'
  attach_file('Image', "spec/images/test.jpg")
  fill_in 'Caption', with: 'nice pic #nice'
  click_button 'Create Post'
  expect(page).to have_content('#nice')
end
