def sign_in(email, password)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

def add_picture(description)
  visit '/pictures'
  click_link 'Add a picture'
  fill_in 'description', with: description
  click_button 'Submit'
end

def show_picture(description)
  click_link description
end
