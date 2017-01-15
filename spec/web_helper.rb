module WebHelpers

  def sign_up(user)
    visit '/'
    click_link "Sign up"
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    fill_in 'user_password_confirmation', with: user[:password]
    click_button 'Sign up'
  end

  def sign_in(user)
    visit '/'
    click_link "Sign in"
    fill_in 'user_email', with: user[:email]
    fill_in 'user_password', with: user[:password]
    click_button 'Log in'
  end

  def create_pun
    visit '/'
    click_link 'Add a pun'
    fill_in 'pun[name]', with: 'Pun1'
    fill_in 'pun[description]', with: 'Funny'
    click_button 'Create Pun'
  end

  def create_another_pun
    visit '/'
    click_link 'Add a pun'
    fill_in 'pun[name]', with: "Jo's pun"
    fill_in 'pun[description]', with: 'Very funny'
    click_button 'Create Pun'
  end

  def comment_pun(comment)
    click_link 'Comment on Pun1'
    fill_in "Message", with: comment[:message]
    click_button 'Leave Comment'
  end

  def sign_out
    click_link "Sign out"
  end

end
