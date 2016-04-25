def sign_up
  visit '/posts'
  click_link("Sign up")
   fill_in("Email", with: "test@test.com")
   fill_in("Password", with: "testtest")
   fill_in("Password confirmation", with: "testtest")
   click_button("Sign up")
end

def sign_up2
  click_link("Sign up")
   fill_in("Email", with: "newtest@test.com")
   fill_in("Password", with: "test1234")
   fill_in("Password confirmation", with: "test1234")
   click_button("Sign up")
end

def create_post
  click_link 'Add a post'
  fill_in 'post[comment]', with: 'yummy!'
  click_button 'Create Post'
end
