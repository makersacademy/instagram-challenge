def sign_up(email: 'pete@pete.com',
            password: 'password',
            password_confirmation: 'password')
  visit '/'
  click_link 'Sign up'
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password_confirmation)
  click_button 'Sign up'
end

def add_picture(title: 'Just a fan enjoying the game',
                url: 'http://68.media.tumblr.com/9150621cddccbc705a6805d15b835767/tumblr_mrhvg5sMPz1r1thfzo1_1280.jpg')
  visit '/'
  click_link 'Add a picture'
  fill_in('Title', with: title)
  fill_in('Url', with: url)
  click_button 'Add Picture'
end
