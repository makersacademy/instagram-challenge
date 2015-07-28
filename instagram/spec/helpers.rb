def sign_up
  visit '/pictures'
  click_link 'Sign up'
  fill_in 'Email', with: 'test123@gmail.com'
  fill_in 'Password', with: '123password'
  fill_in 'Password confirmation', with: '123password'
  click_button 'Sign up'
end

def sign_up_different
  visit '/pictures'
  click_link 'Sign up'
  fill_in 'Email', with: 'space@gmail.com'
  fill_in 'Password', with: '123password'
  fill_in 'Password confirmation', with: '123password'
  click_button 'Sign up'
end


def upload_picture
  click_link 'Add a picture'
  attach_file 'Image','spec/features/rasp.jpg'
  fill_in 'Description', with: 'berries'
  click_button 'Upload picture'
end
