module SessionHelpers

  def sign_up(user)
    visit('/')
    click_link('Sign up')
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with: user.password
    click_button 'Sign up'
  end

  def sign_in(user)
    visit('/')
    click_link('Sign in')
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    click_button 'Log in'
  end

  def create_image
    visit '/images'
    click_link 'Add an Image'
    fill_in 'Name', with: 'breakfast'
    page.attach_file 'image[image]', 'spec/assets/images/dom-s-eatery.jpg'
    click_button 'Create Image'
  end
end
