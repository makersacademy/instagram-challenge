require 'rails_helper'

feature 'Deleting posts' do
  scenario 'Can delete a post from index page' do
    create_post
    visit '/'
    click_link 'Delete Post'

    expect(page).to have_content('Post Deleted')
    expect(page).to_not have_content('amazing #foodart')
  end

  scenario 'Can delete a single post' do
    create_post
    visit '/'

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Delete Post'

    expect(page).to have_content('Post Deleted')
    expect(page).to_not have_content('amazing #foodart')
  end
end
