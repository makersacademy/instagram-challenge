require 'rails_helper'

RSpec.feature 'User Sign Out', type: :feature do
  scenario 'once signed in the user can click a link to sign out' do
    user = FactoryBot.create(:user)
    login_as(user)
    expect(page).to have_link 'Log Out'
  end

  scenario 'user is redirected to the sign in page after signing out' do
    user = FactoryBot.create(:user)
    login_as(user)
    click_link 'Log Out'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Signed out successfully.'
  end

end
