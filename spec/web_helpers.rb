def create_picture
  visit '/pictures'
  click_link 'add a picture'
  attach_file('picture_image', File.absolute_path('./public/cat.png'))
  fill_in 'picture_caption', with: 'This is my cat'
  click_button 'share'
end

def sign_up
  visit('/')
  click_link('sign up')
  fill_in ('Username'), with: 'amanda'
  fill_in('Email', with: 'test@test.com')
  fill_in('Password', with: '123456')
  fill_in('Password confirmation', with: '123456')
  click_button('sign up')
end

def sign_up_second_user
  visit('/')
  click_link('sign up')
  fill_in ('Username'), with: 'lionel'
  fill_in('Email', with: 'lionel@cat.com')
  fill_in('Password', with: '123456')
  fill_in('Password confirmation', with: '123456')
  click_button('sign up')
end
