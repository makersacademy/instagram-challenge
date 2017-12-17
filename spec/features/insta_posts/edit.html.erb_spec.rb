require 'rails_helper'

feature 'Openning the insta_posts#edit page' do
  before(:each) do
    sign_up_user
    create_post
  end

  scenario 'it has a message' do
    click_button(value: "Edit")
    expect(page).to have_content('Edit post')
  end

  scenario 'it edits posts' do
    edit_post
    expect(page).to have_content('Title: new title')
    expect(page).to have_content('Description: new description')
  end
end
