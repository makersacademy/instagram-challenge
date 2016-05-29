require 'rails_helper'

feature 'Editing existing posts' do 
  background do 
    job = create(:post, caption: 'This post is flawless')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Users can edit existing posts' do 
    fill_in 'Caption', with: 'I made a mistake'
    click_button 'Update Post'
    expect(page).to have_content("Post updated!")
    expect(page).to have_content("I made a mistake")
    expect(page).not_to have_content("This post is flawless")
  end
end