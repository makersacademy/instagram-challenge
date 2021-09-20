def sign_up_user
  visit '/'
  click_on 'Sign Up'
  fill_in 'First Name', with: 'Lizzy'
  fill_in 'Surname', with: 'Ballantine'
  fill_in 'Username', with: 'flyingBurrito'
  fill_in 'Email', with: 'cecil3@gmail.com'
  fill_in 'Password', with: 'P@ssword!'
  click_on 'Create Account'
end
