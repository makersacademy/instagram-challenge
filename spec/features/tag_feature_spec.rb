require 'rails_helper'
require_relative '../web_helper'


feature 'tags' do

  before do
    sign_up
  end

  scenario 'users can tag posts' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'post_caption', with: 'this is a cat'
    page.attach_file('post_image', Rails.root + "spec/images/cat.jpg")
    fill_in 'post_all_tags', with: '#cat, #myfriend'
    click_button 'Add'
    expect(page).to have_link '#cat'
    expect(page).to have_link '#myfriend'
  end

  scenario 'tags should begin with a #' do
    visit '/posts'
    click_link 'Add a post'
    fill_in 'post_caption', with: 'this is a cat'
    page.attach_file('post_image', Rails.root + "spec/images/cat.jpg")
    fill_in 'post_all_tags', with: 'cat, myfriend'
    click_button 'Add'
    expect(page).to have_link '#cat'
    expect(page).to have_link '#myfriend'
  end
end
