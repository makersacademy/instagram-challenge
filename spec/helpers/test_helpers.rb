def sign_up_helper(email)
  visit('/')
  click_link('Sign Up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def sign_in(email:, password:)
  visit '/'
  click_link "Sign In"
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Sign In'
end

def create_photograph(caption: 'Kitty!')
  click_link "Add a photograph"
  fill_in "Say something about your photo", with: caption
  click_button "Post Photo"
end
