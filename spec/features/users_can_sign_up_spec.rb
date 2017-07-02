require 'rails_helper'

RSpec.feature "Account Creation", type: :feature do
  scenario "User can supply a name, email and password to create an account" do
    visit "/posts"
    click_link('Sign Up')
    fill_in 'Username', with: 'Jade'
    fill_in 'Email', with: 'jade@jade.com'
    fill_in 'Password', with: '123456'
    click_button 'Submit'
    expect(page).to have_content("Hello Jade!")
  end

end
