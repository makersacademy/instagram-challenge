require 'rails_helper'

feature 'Editing posts works' do
  background do
    post = create(:post)
    visit '/'
    find(:xpath, "//a/img[@alt='Sample 02']/..").click
    click_link 'Edit Post'
  end

  scenario 'via form accessible through update button' do
    fill_in 'Caption', with: 'Editing this caption, because why not?'
    click_button 'Update Post'
    expect(page).to have_content('Post\'s been updated, yo.')
    expect(page).to have_content('Editing this caption, because why not?')
  end

  scenario 'and by providing an image (compulsory).' do
    attach_file('Image', 'spec/files/images/archive.zip')
    click_button 'Update Post'
    expect(page).to have_content('Only a pic file works here, bro.')
  end
end
