def sign_up_and_sign_in(options)
  visit root_path
  click_link 'Sign up'
  fill_in 'Email', with: options[:email]
  fill_in 'Username', with: options[:username]
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
  click_button 'Sign up'
end

def sign_out
  visit root_path
  click_link 'Sign out'
end
