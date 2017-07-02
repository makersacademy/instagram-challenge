require "rails_helper"

RSpec.feature 'Picture Post' do
  scenario 'User can post a picture' do
    visit '/posts/new'
    click_button 'Upload a Photo'
    fill_in 'photo_pajh', with: 'image/path/route'
    fill_in 'Caption'
    click_button 'Upload'
    expect(current_path).to be '/posts'
    expect(page).to contain 'image'
  end
end
