require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario 'user likes a photo' do
    sign_up
    post_photo
    find('a.like').click
    expect(page).to have_content 'Like 1'
    find('a.like').click
    expect(page).to have_content 'Like 1'
  end
end
