def sign_up(username, email, password)
  visit '/users/sign_up'
  fill_in :user_username, with: username
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  fill_in :user_password_confirmation, with: password
  click_on :commit
end

def log_in(email, password)
  visit '/users/sign_in'
  fill_in :user_email, with: email
  fill_in :user_password, with: password
  click_on :commit
end
