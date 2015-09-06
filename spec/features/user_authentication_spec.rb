require 'rails_helper'

feature 'User authentication' do
  background do
    user = create(:user)
  end

  scenario 'can log in from the index' do
    visit '/'
    expect(page).not_to have_content('New Post')

    click_link 'Sign In'
    sign_in

    expect(page).to have_content('Signed in successfully.')
    expect(page).not_to have_content('Sign Up')
    expect(page).to have_content('Sign Out')
  end
end
