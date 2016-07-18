require 'rails_helper'

feature 'Index displays a list of posts' do

  before do
    sign_up
  end


  scenario 'the index displays correct created job information' do
    create_post
    create_post_two
    visit '/'
    expect(page).to have_content("nom nom nom #coffeetime")
    expect(page).to have_content("jungle party")
    expect(page).to have_css("img[src*='coffee']")
  end
end
