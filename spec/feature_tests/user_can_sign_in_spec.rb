require 'rails_helper'
RSpec.describe "User can sign in", :type => :feature do

  before do
    user = User.create email: '123test@gmail.com', password: '123456', password_confirmation: '123456'
  end

  feature 'user can sign in' do
    scenario 'user gives correct details' do
      visit('/')
      click_link 'Login'
      fill_in 'user[email]', with: '123test@gmail.com'
      fill_in 'user[password]', with:'123456'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end
  end
  feature 'user cannot sign in' do
    scenario 'user gives incorrect details' do
      visit('/')
      click_link 'Login'
      fill_in 'user[email]', with: '123test@gmail.com'
      fill_in 'user[password]', with:'123456123'
      click_button 'Log in'
      expect(page.current_path).to eq '/users/sign_in'
    end
  end
end
