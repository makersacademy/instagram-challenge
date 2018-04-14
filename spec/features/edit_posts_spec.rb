require 'rails_helper'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/#{post.id}')]").click
    click_link 'Edit Post'
  end

  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Update: actually, this is me every time I try to program!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Update: actually, this is me every time I try to program!")
  end
end
