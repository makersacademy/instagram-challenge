equire 'rails_helper'

RSpec.feature 'Like', type: :feature do
  scenario 'User can like pictures' do
    create_account
    upload_photo
    click_button 'Like'
    expect(page).to have_content('Like 1')
  end

  scenario 'User can like a post only once' do
    create_account
    upload_photo
    click_button 'Like'
    click_button 'Like'
    expect(page).not_to have_content('Like 2')
  end
end
