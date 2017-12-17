require 'rails_helper'

feature 'Openning the insta_posts#show page' do
  before(:each) do
    create_post
    create_second_post
  end

  scenario 'it has a post on it' do
    expect(page).not_to have_content('Title: generic title')
    expect(page).to have_content('Title: second title')
  end

  scenario 'it has a button conecting to all the post' do
    click_button(value: 'Back')
    expect(page).to have_content('generic title')
    expect(page).to have_content('second description')
  end

  scenario 'it has a button that can delete post' do
    click_button(value: 'Delete')
    expect(page).to have_content('generic title')
    expect(page).not_to have_content('second description')
  end
end
