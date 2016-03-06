require 'rails_helper'

feature 'Editing posts' do
  before do
    job = create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'a user can edit a post' do
    fill_in 'Caption', with: 'I am making an edit to this caption!'
    click_button 'Update Post'

    expect(page).to have_content 'Your post has been updated'
    expect(page).to have_content 'I am making an edit to this caption!'
  end
end
