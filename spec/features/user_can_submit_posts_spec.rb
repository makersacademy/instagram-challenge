# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts' do
    visit '/posts'
    click_link 'New post'
    fill_in 'Caption', with: 'Hello, world!'
    click_button 'Save Post'
    expect(page).to have_content('Hello, world!')
  end


end
