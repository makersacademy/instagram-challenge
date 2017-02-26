require 'rails_helper'

feature 'Editing posts works' do
  background do
    post = create(:post)
    visit '/'
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    find(:xpath, "//a/img[@alt='Sample 02']/..").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: 'Editing this caption, because why not?'
    click_button 'Update Post'
    expect(page).to have_content('Post\'s been updated, yo.')
    expect(page).to have_content('Editing this caption, because why not?')
  end
end
