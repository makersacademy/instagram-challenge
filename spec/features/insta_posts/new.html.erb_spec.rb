require 'rails_helper'

feature 'Openning the insta_posts#new page' do

  before(:each) do
    sign_up_user
    visit('/insta_posts/new')
  end

  scenario 'it has a message' do
    expect(page).to have_content('Create a new post')
  end

  scenario 'it has a title field' do
    expect(page).to have_field(:type => 'text', :name => 'insta_post[title]')
  end

  scenario 'it has a description field' do
    expect(page).to have_field(:type => 'textarea', :name => 'insta_post[description]')
  end

  scenario 'it has a create button' do
    expect(page).to have_button(:value => 'Save Insta post')
  end

  scenario 'it creates a new post' do
    create_post
    expect(page).to have_content("Title: generic title")
    expect(page).to have_content("Description: generic description")
  end

  scenario 'it does not create new post without title' do
    try_creating_post_with_no_title
    expect(page).to have_content('Create a new post')
    expect(page).not_to have_content("Title: second title")
    expect(page).not_to have_content("Description: second description")
  end

  scenario 'it throws an error when creating post with no title' do
    try_creating_post_with_no_title
    expect(page).to have_content("Title can't be blank")
  end

end
