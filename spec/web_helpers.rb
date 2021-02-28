def sign_up
  visit '/users/sign_up'
  fill_in :user_email, with: 'test@email.com'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_button 'Sign up'
end

def add_post

end 
