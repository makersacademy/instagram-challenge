require 'rails_helper'

feature 'Ediitng posts' do
  scenario 'a user can post a picture to the feed and see multiple posts' do
    post = create(:post)

    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit post'
    fill_in 'Caption', with: 'Oops, wrong caption!'
    click_button 'Update Post'
    expect(page).to have_content('Post successfully updated')
    expect(page).to have_content('Oops, wrong caption!')
  end
end 