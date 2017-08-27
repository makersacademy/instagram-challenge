require 'rails_helper.rb'

feature 'Sign Up' do

  scenario 'user can sign up' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'username', with: 'squidward'
    fill_in 'email', with: 'tentacles@ink.com'
    fill_in 'password', with: 'password123'
    fill_in 'password_confirmation', with: 'password123'
    click_button "Go"
    expect(page).to have_content('Welcome to Octogram, squidward')
  end

end
