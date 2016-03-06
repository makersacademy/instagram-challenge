require 'spec_helper'

feature 'Can view individual posts' do

  scenario 'can click and view a single post' do
    job = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/4')]").click
    click_link 'Edit Post'
    fill_in 'Caption', with: 'Comment has been edited'
    click_button 'Update Post'
    expect(page).to have_content 'Post was updated'
    expect(page).to have_content 'Comment has been edited'
  end

  scenario 'user will get a message if updating without an image' do
    job = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/5')]").click
 
    click_link 'Edit Post'
    attach_file('Image', 'spec/files/coffee.zip')
    click_button 'Update Post'

    expect(page).to have_content("Something is wrong with your form!")
  end
end