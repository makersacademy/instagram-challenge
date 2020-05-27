require 'rails_helper'

RSpec.feature 'Like', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario 'user can like an image' do
    click_link 'Like'
    expect(current_path).to eq '/pictures'
    expect(page).not_to have_content '0 Likes'
    expect(page).to have_content '1 Like'
  end

  scenario 'user can unlike an image after liking' do
    click_link 'Like'
    expect(page).not_to have_link 'Like'
    click_link 'Unlike'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content '0 Likes'
  end
end
