require 'rails_helper'

RSpec.feature "User", type: :feature do

  scenario "can sign up to Eatergram" do
		visit('/users/sign_up')
    within(:css, 'form.new_user') do
    fill_in 'user_name', with: 'Oscar'
    fill_in 'user_username', with: 'oscarwao'
		fill_in 'user_bio', with: 'The next J.R.R. Tolkien'
		fill_in 'user_email', with: 'oscar@wao.com'
		fill_in 'user_password', with: '123456'
		fill_in 'user_password_confirmation', with: '123456'
		click_button 'Sign up'
	end
		expect(page).to have_content('Hey Oscar')
  end
end
