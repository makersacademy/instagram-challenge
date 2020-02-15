# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts, date, time and user' do
    sign_up

    visit '/posts'
    click_link 'New post'
    fill_in 'Caption', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('test@email.com')
    expect(page).to have_content(Time.now.strftime('%m/%d/%Y, %H:%M'))
  end


end
