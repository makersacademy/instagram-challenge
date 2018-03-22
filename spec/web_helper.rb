def sign_up
  visit('/')
  click_on('Register')
  fill_in('user[username]', :with => 'testusername')
  fill_in('user[email]', :with => 'email@email.com')
  fill_in('user[password]', :with => 'password')
  fill_in('user[password_confirmation]', :with => 'password')
  click_on('Sign up')
end

def upload_photo
  visit '/photos'
  click_link 'Add Photo'
  fill_in('photo[description]', :with => 'xxx')
  click_button 'Create Photo'
end
