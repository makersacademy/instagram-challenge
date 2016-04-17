def sign_up(username: 'tester',
            email: 'test@example.com',
            password: 'testtest',
            confirm: 'testtest'
            )
  visit '/'
  click_link('Sign up')
  fill_in('Username', with: username)
  fill_in('Email', with: email)
  fill_in('Password', with: password)
  fill_in('Password confirmation', with: confirm)
  click_button "Sign up"
  expect(page).to have_content("Welcome! You have signed up successfully.")

end

def sign_in(email: 'test@example.com',
            password: 'testtest'
            )
    click_link('Sign in')
    fill_in('Email', with: email)
    fill_in('Password', with: password)
    click_button 'Log in'
end
