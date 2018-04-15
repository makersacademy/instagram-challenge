def add_post
  click_link "New post"
  fill_in "post[photo]", with: 'https://cdn.acidcow.com/pics/20131010/instagram_16.jpg'
  fill_in "post[desc]", with: 'Beautiful sunset'
  click_button "Save Post"
end

def sign_up
  visit "/users/sign_up"
  fill_in "user[email]", with: "test@test.com"
  fill_in "user[password]", with: "testtest"
  fill_in "user[password_confirmation]", with: "testtest"
  click_button "Sign up"
end
