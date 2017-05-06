module SessionHelpers

  def sign_up(email: 'test@test.com',
             password: 'test123',
             password_confirmation: 'test123')
    visit root_path
    click_link "Sign up"
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password_confirmation
    click_button "Sign up"
  end

  def login(email: 'test@test.com',
            password: 'test123')
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end

  def sign_out
    click_link 'Sign out'
  end

end
