
def sign_up(email, password)
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password)
  click_button('Sign up')
end

def upload
  click_link 'Add a photo'
  fill_in('Description', with: 'The Beach')
  click_button 'Create Photo'
end
