# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts' do
    visit '/'
    click_link 'Sign Up'
    fill_in 'Email', with: 'cats@cats.com'
    fill_in 'Password', with: 'cats1234'
    fill_in 'Password confirmation', with: 'cats1234'
    click_button 'Sign up'

    visit '/posts'
    click_link 'New post'
    fill_in 'Caption', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
  end


end
