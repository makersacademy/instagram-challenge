require 'rails_helper'

feature 'Ediitng posts' do
  background do
    post = create(:post)
    
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit post'
  end

  scenario 'a user can post a picture to the feed and see multiple posts' do
    fill_in 'Caption', with: 'Oops, wrong caption!'
    click_button 'Update Post'

    expect(page).to have_content('Post successfully updated')
    expect(page).to have_content('Oops, wrong caption!')
  end
end 