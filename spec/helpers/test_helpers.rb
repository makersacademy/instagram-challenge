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
