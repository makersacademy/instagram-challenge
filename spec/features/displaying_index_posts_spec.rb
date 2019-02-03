require 'rails_helper'

feature 'Index displays a list of posts' do
  scenario 'the index displays correct created post information' do
    include WebHelper
    include WebHelper

    visit '/'
    expect(page).to have_content("This is my race bike! #sport")
    expect(page).to have_content("This is my race bike! #sport")
    expect(page).to have_css("img[src*='racebike']")
  end
end
