def add_post
  click_link 'New Post'
  attach_file('Image', "spec/images/NPG.jpg")
  fill_in 'Caption', with: 'Lovely lovely art #nationalportraitgallery'
  click_button 'Create Post'
end

def sign_up
  visit('/')
  click_link('Sign up')
  fill_in('Email', with: 'vicky@vicky.com')
  fill_in('User name', with: 'ledleds')
  fill_in("Password", with: '123456', :match => :prefer_exact)
  fill_in("Password confirmation", with: '123456', :match => :prefer_exact)
  click_button('Sign up')
end
