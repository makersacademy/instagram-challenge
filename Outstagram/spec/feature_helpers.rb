def sign_up
  visit 'users/sign_up'


  fill_in 'Email', with: 'test@test.test'
  fill_in 'First name', with: 'Tester'
  fill_in 'Last name', with: 'McTesterford'
  fill_in 'Password', with: 'passyword'
  fill_in 'Password confirmation', with: 'passyword'
  click_on 'Sign up'
end

def submit_post
  visit '/posts/new'
  attach_file('Image', "spec/test_files/angery.jpg")
  fill_in 'Caption', with: 'MY CAPTIONNN!!!'
  click_on 'Submit post'
end
