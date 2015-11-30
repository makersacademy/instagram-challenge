def sign_up_and_sign_in(options)
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: options[:email]
  fill_in 'Password', with: options[:password]
  fill_in 'Password confirmation', with: options[:password]
  click_button 'Sign up'
end

def sign_out
  visit '/'
  click_link 'Sign out'
end
