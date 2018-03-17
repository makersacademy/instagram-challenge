def sign_up
  visit '/'
  click_link 'sign_up'
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
