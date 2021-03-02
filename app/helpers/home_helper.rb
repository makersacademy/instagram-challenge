module HomeHelper
  def sign_up
    visit('/')
    click_link('Register')
    fill_in('Username', with: 'username')
    fill_in('Email', with: 'test@test.com')
    fill_in('Password', with: 'password')
    fill_in('Password confirmation', with: 'password')
    click_button('Sign up')
  end

  def sign_out
    sign_up
    click_link('Sign out')
  end
end
