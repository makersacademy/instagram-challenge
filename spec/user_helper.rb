module UserSpecHelpers

  def sign_up_and_log_in
    visit '/'
    click_link 'Sign up'
    fill_in 'Email', with: "test@test.com"
    fill_in 'Username', with: "testname123"
    fill_in 'Password', with: "12345678"
    fill_in 'Password confirmation', with: "12345678"
    click_button 'Sign up'
  end

end