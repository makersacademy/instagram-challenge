require 'rails_helper'

feature 'logging out' do
  scenario 'user can successfully log out' do
    sign_up
    click_link 'Logout'

    expect(page).to have_content "Successfully logged out."
    expect(page).not_to have_content 'Welcome, Mr.Test'
  end
end
