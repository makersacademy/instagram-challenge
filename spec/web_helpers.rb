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
