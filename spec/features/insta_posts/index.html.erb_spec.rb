require 'rails_helper'

feature 'Openning the insta_posts#index page' do

  scenario 'it has a message' do
    visit('/insta_posts')
    expect(page).to have_content('See all the post')
  end

  scenario 'it has a list of post' do
    create_post
    create_second_post
    visit('/insta_posts')
    expect(page).to have_content("generic title")
    expect(page).to have_content("generic description")
    expect(page).to have_content("second title")
    expect(page).to have_content("second description")
  end

  scenario 'it can see one specific post' do
    create_post
    create_second_post
    visit('/insta_posts')
    click_link('generic title')
    expect(page).to have_content("Title: generic title")
    expect(page).to have_content("Description: generic description")
    expect(page).not_to have_content("Title: second title")
    expect(page).not_to have_content("Description: second description")
  end
end
