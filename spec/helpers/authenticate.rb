module Helpers
  module Authenticate
    def register
      visit('/')
      click_link 'User login'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password123'
      fill_in 'Password confirmation', with: 'password123'
      click_button 'Sign up'
    end

    def sign_in
      visit '/'
      click_link 'User login'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password123'
      click_button 'Sign in'
    end
  end
end
