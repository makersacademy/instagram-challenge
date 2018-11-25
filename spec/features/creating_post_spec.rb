# frozen_string_literal: true

require 'rails_helper'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/ArmyRyan.jpg")
    fill_in 'Caption', with: 'Did my makeup today #NoFilter'
    click_button 'Create Post'
    expect(page).to have_content('#NoFilter')
    expect(page).to have_css("img[src*='ArmyRyan.jpg']")
  end
  scenario 'can not upload a post without img' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "I'm not uploading no pic dude"
    click_button 'Create Post'
    expect(page).to have_content("can't be blank")
  end
end
