module Helpers
  def login(user)
    visit('/')
    click_link('Login')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_button('Log in')
  end
end
