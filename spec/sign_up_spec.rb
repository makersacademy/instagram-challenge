# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'signup', type: :feature do

  scenario 'Can sign up and sign in' do
    visit '/'
    click_link('Sign up')
    fill_in 'Email', with: '123@hotmail.com'
    fill_in 'Password', with: 'abcdef'
    fill_in 'Password confirmation', with: 'abcdef'
    click_button('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully')

  end




end
