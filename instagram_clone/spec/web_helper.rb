def create_a_photo
  visit '/photos/new'
  fill_in 'title-frm', with: 'testphoto'
  fill_in 'description-frm', with: 'describedtest'
  click_button 'form-submit'
end

def sign_in
  visit('/')
  click_link('Sign Up')
  fill_in 'user_email', with: 'testuser@gmail.com'
  fill_in 'user_password', with: 'testpassword'
  fill_in 'user_password_confirmation', with: 'testpassword'
  click_button 'Sign up'
end
