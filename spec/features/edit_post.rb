require 'rails_helper'

feature 'Edit posts' do
create(:post, caption: "Me and my friends")
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end
  scenario 'Can edit a post' do
    fill_in 'Caption', with: "Me and my friends on holidays"
    click_button 'Update Post'

    expect(page).to have_content("Post updated")
    expect(page).to have_content("Me and my friends on holidays")
  end
