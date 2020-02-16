# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Timeline', type: :feature do
  scenario 'Can submit posts and view posts, date, time and user' do
    sign_up

    visit '/posts'
    click_link 'New Post'
    fill_in 'Caption', with: 'Hello, world!'
    click_button 'Submit'
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('test@email.com')
    expect(page).to have_content(Time.now.strftime('%m/%d/%Y, %H:%M'))
  end

  scenario 'Can submit an image post' do
    sign_up

    visit '/posts'
    click_link 'New Post'
    page.attach_file("Image", Rails.root + 'app/assets/images/cat.png')
    fill_in 'Caption', with: 'Hello, world!'
    click_button 'Submit'
    expect(page.find('#img')['src']).to have_content 'cat.png' 
    expect(page).to have_content('Hello, world!')
    expect(page).to have_content('test@email.com')
    expect(page).to have_content(Time.now.strftime('%m/%d/%Y, %H:%M'))
  end


end
