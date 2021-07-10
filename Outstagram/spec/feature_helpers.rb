def sign_up email: 'test@test.test', first_name: 'Tester', last_name: 'McTesterford', password: 'passyword'
  visit 'users/sign_up'


  fill_in 'Email', with: email
  fill_in 'First name', with: first_name
  fill_in 'Last name', with: last_name
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_on 'Sign up'
end

def submit_post
  visit '/posts/new'
  attach_file('Image', "spec/test_files/angery.jpg")
  fill_in 'Caption', with: 'MY CAPTIONNN!!!'
  click_on 'Submit post'
end
