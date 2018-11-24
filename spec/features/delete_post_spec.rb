require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
  end
  scenario 'Can delete a post' do
    click_link 'Delete Post'
    expect(page).to have_content("Post successfully deleted.")
    expect(page).not_to have_content("nofilter")
  end
end
