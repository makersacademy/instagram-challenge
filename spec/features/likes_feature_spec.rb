require 'rails_helper'

feature 'liking posts' do

  scenario 'a user can like a post, which updates the post like count', js: true do
    signup
    create_post
    visit '/'
    find('.image-container').hover
    find('.likes .icon').click
    expect(page).to have_content('1 like')
  end

  scenario 'limits users to one like per photo', js: true do
    signup
    create_post
    visit '/'
    find('.image-container').hover
    find('.likes .icon').click
    find('.likes .icon').click
    find('.likes .icon').click
    expect(page).to have_content('1 like')
  end

  xscenario 'a user can like a post within a single-post view, which updates the post like count', js: true do
    signup
    create_post
    visit '/'
    find('.image-container').hover
    click_link 'More'
    find('.likes-link').click
    expect(page).to have_content('1 like')
  end

end
