def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: "lint@lint.com"
  fill_in 'Password', with: "iLoveLint"
  fill_in 'Password confirmation', with: "iLoveLint"
  click_button "Sign up"
end

def create_picture
  visit '/pictures'
  click_link 'New lint'
  fill_in "picture[url]", with: "https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg"
  click_button 'Save Picture'
end

def sign_up_and_create_image_and_sign_out_user_1
  sign_up
  create_picture
  click_link 'Sign out'
end

def sign_up_user_2
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: "lint_user_2@lint.com"
  fill_in 'Password', with: "iLoveLint"
  fill_in 'Password confirmation', with: "iLoveLint"
  click_button "Sign up"
end

def create_comment
  fill_in "comment[body]", with: "I really like this piece of lint"
  click_button "Save comment"
end
