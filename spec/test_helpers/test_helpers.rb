module TestHelpers

  def register(user)
    visit '/'
    click_link 'Register'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password_confirmation
    click_button 'Register'
  end

  def log_in(user)
    visit '/'
    click_link 'Log in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  def leave_comment
    visit '/'
    click_link 'Add a picture'
    attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
    fill_in 'Name', with: 'Kiss'
    click_button 'Create Picture'
    visit '/'
    click_link 'Kiss'
    fill_in 'Comment', with: 'I am a comment'
    click_button 'Leave comment'
  end

end
