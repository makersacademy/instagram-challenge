
require 'rails_helper'

feature 'shows user' do
  scenario 'user signs up and can be accessed by id' do
    visit '/users/sign_up'
    fill_in 'user_user_name', with: 'Example Name'
    fill_in 'user_email', with: 'example@example.com'
    fill_in 'user_password', with: 'examplepassword'
    fill_in 'user_password_confirmation', with: 'examplepassword'
    click_button 'Sign up'

    expect(page).to have_content("Foodstagram")
  end
end
