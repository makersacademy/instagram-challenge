module SessionHelpers
  def sign_up(user)
     visit '/users/sign_up'
     fill_in :Email,                      with: user.email
     fill_in :user_password,              with: user.password
     fill_in :user_password_confirmation, with: user.password_confirmation
     click_button 'Sign up'
     visit '/pictures'
   end

   def sign_in(user)
      visit '/users/sign_in'
      fill_in :Email,                      with: user.email
      fill_in :Password,                 with: user.password
      click_button 'Log in'
      visit '/pictures'
    end
 end
