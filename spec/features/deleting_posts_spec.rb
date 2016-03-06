require 'rails_helper'

feature 'Deleting posts' do
  before do
    visit '/'
    sign_up
    # job = create(:post, caption: 'This post was accidental.', user:)
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'New Post'
    attach_file('Image', 'spec/files/images/scenery.jpg')
    fill_in 'Caption', with: 'This post was accidental.'
    click_button 'Create Post'
    visit '/'
    click_link 'This post was accidental.'
  end

  scenario 'users can delete posts' do
    click_link 'Delete Post'
    expect(page).to have_content 'Your post has been deleted'
    expect(page).not_to have_content 'This post was accidental.'
  end
end
