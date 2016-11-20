def sign_in(email, password)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def add_picture(text)
  visit '/pictures'
  click_link 'Add a picture'
  fill_in 'Description', with: text
  click_button 'Post picture'
end

def visit_picture(description)
  visit '/pictures'
  click_link description
end
