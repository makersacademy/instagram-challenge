require 'rails_helper'

feature 'Openning the insta_posts#index page' do

  scenario 'it has a message' do
    visit('/insta_posts')
    expect(page).to have_content('See all the post')
  end
end
