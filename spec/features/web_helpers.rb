def sign_up_test_user_1
  visit "/"
  click_link "Sign Up For !nstagram"
  fill_in "user[email]", with: "test1@test.com"
  fill_in "user[username]", with: "Test User 1"
  fill_in "user[password]", with: "testtest"
  fill_in "user[password_confirmation]", with: "testtest"
  click_button "Sign up"
end

def sign_in_test_user_1
  visit "/"
  click_link "Log In"
  fill_in "user[email]", with: "test1@test.com"
  fill_in "user[password]", with: "testtest"
  click_button "Log in"
end

def create_test_user_2
  User.create(email: "test2@test.com", password: "testtest", password_confirmation: "testtest", username: 'Test User 2')
end

def sign_in_test_user_2
  visit "/"
  click_link "Log In"
  fill_in "user[email]", with: "test2@test.com"
  fill_in "user[password]", with: "testtest"
  click_button "Log in"
end

def post_goat
  testImageURL = "https://upload.wikimedia.org/wikipedia/commons/f/ff/Domestic_goat_kid_in_capeweed.jpg"
  click_link "Post a Photo"
  fill_in "post[image_url]", with: testImageURL
  click_button "Post"
end
