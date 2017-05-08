def sign_up(email = 'kate@kate.com')
  visit '/users/sign_up'
  fill_in 'email', with: email
  fill_in 'password', with: '123456'
  fill_in 'password confirmation', with: '123456'
  click_button 'sign up'
end

def share_picture(caption = 'sally')
  visit '/pictures'
  click_link 'share a picture'
  fill_in 'caption', with: caption
  click_button 'share picture'
end

def add_comment(thoughts = 'lovexxx')
  visit '/pictures'
  fill_in 'comments_box', with: thoughts
  click_button 'comment'
end

def create_picture_with_user(email = 'kate@kate.com', caption = 'sally')
  User.create(email: email, password: '123456', password_confirmation: '123456')
  Picture.create(caption: caption, user: User.first)
end
