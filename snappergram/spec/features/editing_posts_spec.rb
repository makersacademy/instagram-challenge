require 'rails_helper'

feature 'Editing posts' do
  background do
    create(:post)
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link('Edit Post')
  end

  scenario 'user can edit post' do
    fill_in 'Caption', with: "This post has been edited"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("This post has been edited")
  end


end
