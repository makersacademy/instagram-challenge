require 'rails_helper'

RSpec.feature 'User Name', type: :feature do
  scenario 'user name appears on the home page after sign up' do
    sign_up

    within('.profile-name') do
      expect(page).to have_content "Ruby"
    end
  end

  scenario 'user name appears on the home page after sign in' do
    user = FactoryBot.create(:user)
    login_as(user)

    within('.profile-name') do
      expect(page).to have_content "#{user.name}"
    end
  end
end
