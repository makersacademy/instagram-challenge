require 'rails_helper'

feature 'Add photo button visibility' do

  before(:each) do
    User.delete_all
  end

  scenario 'Signed up user sees the add photo button' do
    sign_up
    expect(page).to have_content('Add Photo')
  end

  scenario 'Logged in user sees the add photo button' do
    sign_up
    click_on('Logout')
    click_on('Login')
    fill_in('user[email]', :with => 'email@email.com')
    fill_in('user[password]', :with => 'password')
    click_on('Log in')
    expect(page).to have_content('Add Photo')
  end

  scenario 'user that is not logged in doesnt see the add photo button' do
    visit('/')
    expect(page).not_to have_content('Add Photo')
  end

end
