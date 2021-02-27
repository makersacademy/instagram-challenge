# frozen_string_literal: true

require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/coffee.jpg')
    fill_in 'Caption', with: '#coffeeislife'
    click_button 'Create Post'
    expect(page).to have_content('#coffeeislife')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end


