def create_picture
  visit '/pictures'
  click_link 'Add a picture'
  attach_file('picture_image', File.absolute_path('./public/cat.png'))
  fill_in 'picture_caption', with: 'This is my cat'
  click_button 'Share'
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in ('Username'), with: 'amanda'
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: '123456')
  fill_in('Password confirmation', with: '123456')
  click_button('Sign up')
end
