def sign_in
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'test@example.com')
  fill_in('Password', with: 'testtest')
  fill_in('Password confirmation', with: 'testtest')
  click_button('Sign up')
end


def add_picture
  visit '/pictures'
  click_link 'Add a picture'
  attach_file('Image', "#{Rails.root}/spec/support/uploads/derp.png")
  click_button 'Create Picture'
end 


