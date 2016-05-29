def sign_in_as(user)
  visit "/"
  click_link "Sign in"
  fill_in :user_email, with: user.email
  fill_in :user_password, with: user.password
  click_button "Log in"
end

def post_picture
  visit pictures_path
  click_link 'Add a picture'
  attach_file :picture_image, "./spec/images/succulents.jpg"
  fill_in 'Description', with: '#sweetsucculents'
  click_button 'Post'
end
