module FeatureHelper

  def sign_up(username:'Batman', email: 'Letian@gmail.com')
    visit '/'
    click_link 'Register'
    fill_in 'User name', with: username
    fill_in 'Email', with: email
    fill_in("Password", with: '123456', :match => :prefer_exact)
    fill_in("Password confirmation", with: '123456', :match => :prefer_exact)
    click_button 'Sign up'
  end

  def post_image(caption: 'Dig that hole')
    visit '/'
    click_link 'New Post'
    attach_file "Image", 'spec/support/fixtures/1.jpg'
    fill_in 'Caption', with: caption
    click_button 'Create Post'
  end

end

