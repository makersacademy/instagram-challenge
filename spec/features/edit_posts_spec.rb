require 'rails_helper'
include HomeHelper

RSpec.feature 'user can update a post' do
  scenario 'and you can see it on the feed' do
    sign_up
    click_link('New Image')
    fill_in('Caption', with: 'coffee')
    attach_file('image[image]', 'spec/images/coffee.jpeg')
    click_button('Create Image')
    click_link('Back')
    click_link('Edit')
    fill_in('Caption', with: 'coffee2')
    click_button('Update Image')
    expect(page).to have_content('coffee2')
    expect(page).to have_css("img[src*='coffee.jpeg']")
  end
end
