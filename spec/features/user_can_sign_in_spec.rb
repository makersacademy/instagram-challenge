require 'rails_helper'

RSpec.feature 'User Sign In', type: :feature do
  scenario 'the user see prompts for email and password' do
    visit '/'
    click_link 'Log in'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Email'
    expect(page).to have_content 'Password'
  end

  scenario 'the user can only enter valid email and password' do
    user = FactoryBot.create(:user)
    login_as(user, :scope => :user)
    expect(page).to have_content 'Signed in successfully.'
  end
end
