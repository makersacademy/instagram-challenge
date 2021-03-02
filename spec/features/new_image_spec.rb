require 'rails_helper'
include HomeHelper

RSpec.feature 'user can upload an image' do
  scenario 'and you can see it on the feed' do
    sign_up
    click_link('New Image')
    fill_in('Caption', with: 'coffee')
    attach_file('image[image]', 'spec/images/coffee.jpeg')
    click_button('Create Image')
    expect(page).to have_content('coffee')
    expect(page).to have_css("img[src*='coffee.jpeg']")
  end
end
