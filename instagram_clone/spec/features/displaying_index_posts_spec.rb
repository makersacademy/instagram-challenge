require 'rails_helper'

feature 'Index displays a list of posts' do

  scenario 'the index displays correct created job information' do
    sign_up
    create_post
    create_post_two
    visit '/'
    expect(page).to have_content("nom nom nom #coffeetime")
    expect(page).to have_content("jungle party")
    expect(page).to have_css("img[src*='coffee']")
  end

  scenario 'cannot view index posts without logging in' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end

  scenario 'cannot create a new post without logging in' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
