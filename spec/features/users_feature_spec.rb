require 'rails_helper'

feature 'Creating a new user' do

  before(:each) do
    visit '/'
    click_link 'Register'
  end

  scenario 'can create a new user from the index page' do
    fill_in 'Email', with: 'Letian@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'

    click_button 'Sign up'
    expect(current_path).to eq '/posts/index'
    expect(page).to have_content 'Welcome! You have successfully signed up.'
  end
end

feature 'User can sign in and out' do
  context 'User not sign in' do
    it 'should be able to see register and login link' do
      visit '/'
      expect(page).to have_link('Register')
      expect(page).to have_link('Login')
    end

    it 'should not see Logout link' do
      visit '/'
      expect(page).not_to have_link('Logout')
    end
  end

end