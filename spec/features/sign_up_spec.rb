require 'spec_helper.rb'
require 'rails_helper.rb'


feature 'User account' do
  scenario 'user can sign up for account' do
    visit '/'
    click_link 'Login'
    click_link 'Sign up'
    fill_in 'Username', with: 'satoshi'
    fill_in 'Email', with: 'sam@msn.com'
    fill_in 'Password', with: 'capybara'
    fill_in 'Password confirmation', with: 'capybara'
    click_button 'Sign up'
    expect(page).to have_content('You have signed up successfully')
  end
end
