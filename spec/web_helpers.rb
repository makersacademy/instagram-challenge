def sign_up
  visit '/'
  find("a:contains('Sign up')").click
  fill_in "user_username", with: "Li"
  fill_in "user_email", with: 'li@gmail.com'
  fill_in "user_password", with: "password"
  fill_in "user_password_confirmation", with: "password"
  click_button "Sign up"
end

def add_new_picture
  click_button "Add Image"
  attach_file("file_upload", Rails.root + "spec/fixtures/fallingwater.jpg" )
  fill_in "picture_caption", with: "Gorgeous place"
  click_button "Post Picture"
end
