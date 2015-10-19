module Helpers

  def sign_up(user)
    visit '/'
    click_link 'Sign up'
    fill_in 'Email',    with: user.email, :match => :prefer_exact
    fill_in 'Username', with: user.userName,
    fill_in 'Password', with: user.password, :match => :prefer_exact
    fill_in 'Password confirmation', with: user.password
    click_button 'Sign up'
  end

end
