require 'rails_helper'

RSpec.feature 'Upload', type: :feature do
  scenario 'Can edit photos caption' do
    visit '/'
    click_link 'Logout'
    click_link 'Sign Up'
    fill_in 'user_email', with: 'tests@mail.com'
    fill_in 'user_password', with: 'test123'
    fill_in 'user_password_confirmation', with: 'test123'
    click_button 'Sign up'
    upload_image
    id = Gram.all[0].id
    visit '/grams/' + id.to_s
    click_link 'Edit'
    fill_in 'gram_caption', with: 'Easy Peasy Lemon Squeasy'
    click_button 'Update Gram'
    visit '/grams/' + id.to_s
    expect(page).to have_content('Easy Peasy Lemon Squeasy')
    click_link 'Logout'
  end
end
