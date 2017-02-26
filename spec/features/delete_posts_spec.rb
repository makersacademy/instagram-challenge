require 'rails_helper'

feature 'Deleting posts works' do
  background do
    post = create(:post, caption: 'This is what I do instead of working.')
    visit '/'
    find(:xpath, "//a/img[@alt='Sample 02']/..").click
  end

  scenario 'via dedicated individual link.' do
    click_link 'Delete Post'
    expect(page).to have_content('Post\'s been deleted, phew!')
    expect(page).to_not have_content('This is what I do instead of working.')
  end
end
