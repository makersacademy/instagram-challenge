module UserHelpers
  def sign_up(first_name: 'John',
              last_name: 'Smith',
              username: 'jsmith',
              email: 'john@smith.com',
              password: '123456',
              password_confirmation: '123456')
    visit '/users/sign_up'
    fill_in 'user_first_name', with: first_name
    fill_in 'user_last_name', with: last_name
    fill_in 'user_username', with: username    
    fill_in 'user_email' , with: email
    fill_in 'user_password', with: password
    fill_in 'user_password_confirmation', with: password_confirmation
    click_button 'Sign up'
  end
end
