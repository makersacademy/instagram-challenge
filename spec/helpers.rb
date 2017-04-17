module Helpers

  def sign_up(user)
    visit '/'
    click_link 'Sign up'
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
  end

  def leave_comment(comment)
    visit '/pictures'
    click_link "Comment"
    fill_in 'comment', with: comment
    click_button 'Leave Comment'
  end

  def add_picture(description)
    visit '/pictures'
    click_link 'Add a picture'
    fill_in 'Description', with: description
    click_button 'Create Picture'
  end

end
