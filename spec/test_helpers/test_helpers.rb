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

  def add_picture
    click_link 'New Post'
    attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
    fill_in 'Name', with: 'Duck Punching'
    click_button 'Create Picture'
  end

  def leave_comment
    add_picture
    visit '/'
    click_link 'Duck'
    fill_in 'New comment', with: 'I am a comment'
    click_button 'Leave comment'
  end

  def edit_comment
    click_link 'Edit comment'
    fill_in 'Comment', with: "There is a comment"
    click_button 'Edit comment'
  end

end
