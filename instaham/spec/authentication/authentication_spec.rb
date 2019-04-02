require 'rails_helper'
require_relative '../test_helper_methods.rb'

RSpec.feature "Authentication", type: :feature, js: true do
  scenario 'users redirected to sign_up page when not logged in' do
    visit "/"
    expect(page).to have_current_path('/users/sign_in')
  end

  scenario 'users can sign in and see the hams feed' do
    sign_up
    click_link('Logout')
    fill_in('user_email', :with => 'tester@test.com')
    fill_in('user_password', :with => 'testing123')
    click_button('Log in')
    expect(page).to have_current_path('/')
  end
end
