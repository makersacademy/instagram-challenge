def add_post
  visit '/posts'
  click_link "Post a new photo"
  fill_in "Description", with: "Beach life"
  attach_file("post_image", "#{Rails.root}/spec/beach.jpg")
  click_button "Create Post"
end

def sign_up
  visit '/users/sign_up'
  fill_in "Email", with: "test@test.com"
  fill_in "Password", with: "testingiscool"
  fill_in "Password confirmation", with: "testingiscool"
  click_button "Sign up"
end

def sign_up2
  visit '/users/sign_up'
  fill_in "Email", with: "test2@test.com"
  fill_in "Password", with: "testingstuff"
  fill_in "Password confirmation", with: "testingstuff"
  click_button "Sign up"
end
