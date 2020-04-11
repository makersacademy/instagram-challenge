require 'rails_helper'

RSpec.feature 'User Sign Out', type: :feature do
  scenario 'once signed in the user can click a link to sign out' do
    user = FactoryBot.create(:user)
    login_as(user)
    expect(page).to have_link 'Log Out'
  end

end
