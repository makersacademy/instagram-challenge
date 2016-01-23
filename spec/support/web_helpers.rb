def sign_up(email: 'charlie.person@hyperisland.se',
            password: 'testtest',
            password_confirmation: 'testtest')
  visit '/'
  click_link('Sign up')
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: password_confirmation)
  click_button('Sign up')
end
