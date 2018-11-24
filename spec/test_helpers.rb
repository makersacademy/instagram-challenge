def user_sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'user[username]', with: 'username123'
  fill_in 'user[email]', with: 'user@user.com'
  fill_in 'user[password]', with: 'pword123'
  fill_in 'user[password_confirmation]', with: 'pword123'
  click_button 'Sign up'
end

def user_sign_out
  visit '/'
  click_link 'Logout'
end

def user_sign_in
  visit '/'
  click_link 'Login'
  fill_in "user[email]", with: "user@user.com"
  fill_in "user[password]", with: "pword123"
  click_button "Log in"
end
