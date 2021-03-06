require 'rails_helper'
include HomeHelper

RSpec.feature 'user can delete a post' do
  scenario 'and you wont see it on the feed' do
    sign_up
    click_link('New Image')
    fill_in('Caption', with: 'coffee')
    attach_file('image[image]', 'spec/images/coffee.jpeg')
    click_button('Create Image')
    click_link('Back')
    click_link('Destroy')
    expect(page).to_not have_content('coffee')
    expect(page).to_not have_css("img[src*='coffee.jpeg']")
  end
end
