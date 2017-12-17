require 'rails_helper'

feature 'Openning the insta_posts#new page' do

  before(:each) do
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

end
