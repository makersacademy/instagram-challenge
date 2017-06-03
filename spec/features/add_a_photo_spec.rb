require 'rails_helper'

RSpec.feature 'Photos', type: :feature do
  scenario 'user adds a photo' do
    visit '/photos'
    click_on 'Post Photo'
    fill_in 'photo_title', with: 'Medieval Lion'
    page.attach_file('photo_image', Rails.root + 'app/assets/images/lion.jpg')
    click_on 'Upload'
    expect(page).to have_content 'Medieval Lion'
  end
end
