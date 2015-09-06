module Helpers
 def sign_in(user)
   visit '/'
   click_link 'Sign in'
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Log in'
 end
end
