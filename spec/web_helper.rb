def create_new_image()
  Image.create()
end

def sign_up(email='test@example.com', password='testtest', cpassword='testtest')
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: cpassword)
  click_button('Sign up')
end
