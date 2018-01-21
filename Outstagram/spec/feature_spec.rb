require 'rails_helper'
require 'feature_helpers'

feature 'users' do
  scenario 'users can sign up' do
    sign_up
    expect(page).to have_content 'Welcome Tester'
  end
end

feature 'create image posts' do
  scenario 'signed in users can add image posts' do
    sign_up
    submit_post
    expect(page).to have_content 'MY CAPTIONNN!!!'
    expect(page).to have_css "img[src*='angery.jpg']"
  end
end

feature 'view posts' do
  scenario 'user can view posts' do
    sign_up
    submit_post
    click_on 'View'
    expect(page).to have_content 'MY CAPTIONNN!!!'
    expect(page).to have_css "img[src*='angery.jpg']"
    expect(page).to have_content 'Comments:'
  end
end
