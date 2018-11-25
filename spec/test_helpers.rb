def user_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user[username]', with: 'username123'
  fill_in 'user[email]', with: 'user@user.com'
  fill_in 'user[password]', with: 'pword123'
  fill_in 'user[password_confirmation]', with: 'pword123'
  click_button 'Sign up'
end

def user2_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user[username]', with: 'username456'
  fill_in 'user[email]', with: 'user2@user.com'
  fill_in 'user[password]', with: 'pword123'
  fill_in 'user[password_confirmation]', with: 'pword123'
  click_button 'Sign up'
end

def user_sign_out
  visit '/'
  click_link 'Logout'
end

def user_sign_in
  visit '/'
  click_link 'Login'
  fill_in "user[email]", with: "user@user.com"
  fill_in "user[password]", with: "pword123"
  click_button "Log in"
end

def upload_image
  Rails.root + "spec/fixtures/image.jpg"
end

def create_new_post
  visit '/posts/new'
  fill_in "post[description]", with: "My post desrciption"
  attach_file("post[image]", upload_image)
  click_button "Create Post"
end

def upload_helper
  image_src = File.join(Rails.root, "/spec/fixtures/image.jpg")
  File.new(image_src)
end
