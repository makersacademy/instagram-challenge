require 'rails_helper'

feature 'Openning the insta_posts#new page' do

  before(:each) do
    visit('/insta_posts/new')
  end

  scenario 'it have a message' do
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
    fill_in('insta_post[title]', with: 'generic title')
    fill_in('insta_post[description]', with: 'generic description')
    click_button('Save Insta post')
    expect(page).to have_content("Hey look at this: generic title")
    expect(page).to have_content("With this: generic title")
  end

end
