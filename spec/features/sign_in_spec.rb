require 'rails_helper'
describe 'Sign in' do
  let(:user) { FactoryBot.create(:user) }
  scenario 'user visits sign in page' do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button "Log in"
    expect(page).to have_content('Signed in successfully')
  end
end
