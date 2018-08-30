# frozen_string_literal: true

require 'rails_helper.rb'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New post'
    attach_file('image', "spec/files/images/caffeine-coffee-cup-6347.jpg")
    fill_in 'Caption', with: 'Java time #brew'
    click_button 'Create Post'
    expect(page).to have_content('#brew')
    expect(page).to have_css("img[src*='caffeine-coffee-cup-6347.jpg']")
  end
end
