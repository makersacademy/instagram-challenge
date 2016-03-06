require 'rails_helper'

feature 'Deleting posts' do
  before do
    job = create(:post, caption: 'This post was accidental.')
    visit '/'
    sign_up
    # find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'This post was accidental.'
  end

  scenario 'users can delete posts' do
    click_link 'Delete Post'
    expect(page).to have_content 'Your post has been deleted'
    expect(page).not_to have_content 'This post was accidental.'
  end
end
