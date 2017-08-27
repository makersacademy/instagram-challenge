module UserHelpers
  def sign_up(email: 'natgeo@natgeo.com',
              password: 'natgeo!',
              password_confirmation: 'natgeo!')
    visit '/users/sign_up'
    fill_in 'user_email', with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end
