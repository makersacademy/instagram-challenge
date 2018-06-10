def sign_up_sign_in_make_post
  visit('/')
  click_link "Sign up"
  fill_in "Username", with: 'Example'
  fill_in "Email", with: 'example@hotmail.com'
  fill_in "Password", with: '123456'
  fill_in "Password confirmation", with: '123456'
  click_button "Sign up"
  page.attach_file("post_photo", File.absolute_path('./app/assets/images/Iceland_Northern_Lights_Special_4_Nights_1.jpg'))
  fill_in "Caption", with: 'example'
  click_button "Submit"
end
