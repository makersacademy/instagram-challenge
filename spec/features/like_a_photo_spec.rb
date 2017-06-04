require 'rails_helper'

RSpec.feature 'Likes', type: :feature do
  scenario 'user likes a photo' do
    sign_up
    post_photo
    click_on 'like'
    expect(page).to have_content 'Like 1'
    click_on 'like'
    expect(page).to have_content 'Like 1'
  end
end
