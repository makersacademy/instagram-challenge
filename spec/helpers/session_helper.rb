module SessionHelper

  def sign_up(username: 'test',email: 'test@example.com', password: 'testtest')
    visit('/')
    click_link('Sign up')
    fill_in('Username', with: username)
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    fill_in('Password confirmation', with: password)
    click_button('Sign up')
  end

  def sign_in(login = 'test', password = 'testtest')
    visit('/')
    click_link('Sign in')
    fill_in('Login', with: login)
    fill_in('Password', with: password)
    click_button('Sign in')
  end

  def sign_out
    click_link('Sign out')
  end

end
