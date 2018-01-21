require 'rails_helper'
require 'feature_helpers'

feature 'users' do
  scenario 'users can sign up' do
    sign_up
    expect(page).to have_content 'Welcome Tester'
  end
  scenario 'users can sign out' do
    sign_up
    click_on 'Sign Out'
    expect(page).not_to have_content 'Welcome Tester'
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

feature 'commenting' do
  scenario 'user can comment on posts' do
    sign_up
    submit_post
    click_on 'Sign Out'
    sign_up email: 'test2@test.test'
    click_on 'View'
    fill_in 'Comment', with: 'AAHHH LAAKES THAAAS!'
    click_on 'Submit comment'
    expect(page).to have_content 'AAHHH LAAKES THAAAS!'
  end
end
