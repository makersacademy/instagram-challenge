require 'rails_helper'

feature 'Registration' do

  scenario 'User can also enter his/her username when registering' do
    visit '/users/sign_up'
    expect(page).to have_field 'Username'
  end

  scenario 'Username is displayed after sign up' do
    sign_up(username: 'arukomp')
    expect(page).to have_content 'arukomp'
  end

end
