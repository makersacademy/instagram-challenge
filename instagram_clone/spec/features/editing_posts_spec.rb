require 'rails_helper'

feature 'Editing posts' do
  before do
    post = create(:post)

    visit root_path
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: 'oops. I needed to edit this'
    click_button 'Update Post'
    expect(page).to have_content('Post updated')
    expect(page).to have_content('oops. I needed to edit this')
  end
end
