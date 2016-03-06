def user_signup(email)
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end

def create_photo(name, description)
  visit '/'
  click_link 'Add a Photo'
  fill_in 'Name', with: name
  fill_in 'Description', with: description
  attach_file "Image", Rails.root.join('spec','images','ounce_weight.jpg')
  click_button 'Create Photo'
end
