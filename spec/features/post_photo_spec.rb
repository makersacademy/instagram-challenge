# frozen_string_literal: true

require 'rails_helper'

feature 'Post a photo' do
  scenario 'can post a photo' do
    visit '/'
    click_on 'new post'
    attach_file('Image', 'spec/files/images/one.jpg')
    fill_in 'Caption', with: 'number one'
    click_on 'Post'
    expect(page).to have_content('number one')
    expect(page).to have_css("img[src*='one.jpg']")
  end

  scenario 'post must contain image' do
    visit '/'
    click_on 'new post'
    fill_in 'Caption', with: 'number two'
    click_on 'Post'
    expect(page).to have_content('Error: No image uploaded')
  end
end
