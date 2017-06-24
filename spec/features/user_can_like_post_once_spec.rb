require 'rails_helper'
require 'web_helpers'

RSpec.feature 'Like', type: :feature do
  scenario 'User can like posts' do
    sign_up
    add_an_image
    click_on 'Shotwall'
    click_button 'Like'
    expect(page).to have_content('Like 1')
  end

  scenario 'User can like a post only once' do
    sign_up
    add_an_image
    click_on 'Shotwall'
    click_button 'Like'
    click_button 'Like'
    expect(page).not_to have_content('Like 2')
  end
end
