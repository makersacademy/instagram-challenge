require 'rails_helper'

feature 'A logged in user can' do

  before do
    sign_up('test@test.com')
    visit '/'
  end

  scenario 'add a new picture' do
    click_link 'Add a picture'
    # click_link 'picture_image'
    fill_in 'picture_description', with: 'My Cat'
    click_button 'Create Picture'
    expect(page).to have_content 'My Cat'
    expect(page).not_to have_content 'no photes have been added!'
  end
end