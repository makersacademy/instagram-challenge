require 'rails_helper'

RSpec.feature 'Signing up', type: :feature do
  scenario 'Signing up with suitable credentials' do
    visit '/users/new'
    fill_in 'name', with: 'test'
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: '123'
    fill_in 'password_confirmation', with: '123'
    click_button 'Sign Up'
    expect(current_path).not_to eq('/users/new')
  end
end
