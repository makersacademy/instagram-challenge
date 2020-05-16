require 'rails_helper'

RSpec.feature 'User Name', type: :feature do
  scenario 'user name appears on the home page after sign up' do
    sign_up
    expect(page).to have_content 'Hello, Ruby!'
  end

  scenario 'user name appears on the home page after sign in' do
    user = FactoryBot.create(:user)
    login_as(user)
    expect(page).to have_content "Hello, #{user.name}!"
  end
end
