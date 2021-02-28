require 'rails_helper'

describe 'User sign up', type: :feature do
  scenario 'users can sign up from home page' do 
    visit '/'
    click_link('Sign Up')
    fill_in 'Username', :with => 'panman'
    fill_in 'Email', :with => 'panman@email.com'
    fill_in 'Password', :with => 'password'
    fill_in 'Password Confirmation', :with => 'password'
    click_button('Sign Up')
    expect(page).to have_content('Hello panman')
  end 
end 