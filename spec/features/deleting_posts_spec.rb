require 'rails_helper'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: 'I am so random lol')
        
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit post'
  end

  scenario 'Can delete a post' do
    click_link 'Delete post'
    expect(page).to have_content('Post successfully deleted')
    expect(page).to_not have_content('I am so random lol')
  end
end
