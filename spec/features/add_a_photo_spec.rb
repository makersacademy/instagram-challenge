require 'rails_helper'

RSpec.feature 'Photos', type: :feature do
  scenario 'user adds a photo' do
    sign_up
    post_photo
    expect(page).to have_content '55 Bar'
    expect(page).to have_content "Added by chase@ph.com at #{Time.now.strftime('%H:%M, %d/%m/%Y')}"
    expect(page).to have_css('img')
  end
end
